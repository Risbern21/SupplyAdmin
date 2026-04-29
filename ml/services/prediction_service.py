"""
gRPC servicers for the ML layer.

Three servicers map to the three proto services:
  - ShipmentServiceServicer  → PredictRisk  (shipment.proto)
  - RouteServiceServicer     → OptimizeRoute (route.proto)
  - DisruptionServiceServicer→ AnalyzeShipment (disruption.proto)
"""

import logging
import sys
import os

sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", ".."))

from ml.api.predict import predict_risk
from ml.api.route_optimizer import optimize_route
from ml.services.gemini_service import analyze_disruption
from ml.gen import (
    shipment_pb2, shipment_pb2_grpc,
    route_pb2, route_pb2_grpc,
    disruption_pb2, disruption_pb2_grpc,
)

logger = logging.getLogger(__name__)


# ── ShipmentService → PredictRisk ────────────────────────────────────────────

class ShipmentServiceServicer(shipment_pb2_grpc.ShipmentServiceServicer):

    def PredictRisk(self, request, context):
        """Run the RandomForest model and return a risk score."""
        input_data = {
            "weather_severity": request.weather_severity,
            "traffic_density": request.traffic_density,
            "route_congestion": request.route_congestion,
            "distance_remaining": request.distance_remaining,
            "time_of_day": request.time_of_day,
            "day_of_week": request.day_of_week,
            "vehicle_speed": request.vehicle_speed,
        }

        risk_score = predict_risk(input_data)

        if risk_score >= 0.7:
            risk_level = "HIGH"
        elif risk_score >= 0.4:
            risk_level = "MEDIUM"
        else:
            risk_level = "LOW"

        logger.info("PredictRisk [id=%s] → score=%.4f level=%s",
                    request.id, risk_score, risk_level)

        return shipment_pb2.PredictRiskResponse(
            risk_score=risk_score,
            risk_level=risk_level,
        )


# ── RouteService → OptimizeRoute ─────────────────────────────────────────────

class RouteServiceServicer(route_pb2_grpc.RouteServiceServicer):

    def OptimizeRoute(self, request, context):
        """Score each Route candidate and return the safest one."""
        routes = []
        for r in request.route_candidates:
            routes.append({
                "route_id": r.shipment_id,  # use shipment_id as identifier
                "distance": r.distance_km,
                "traffic": float(r.traffic) if r.traffic else 0.5,
                "weather": float(r.weather) if r.weather else 0.5,
            })

        best, all_scored = optimize_route(routes)

        def _to_route(scored, original):
            return route_pb2.Route(
                shipment_id=original.shipment_id,
                points=original.points,
                estimated_duration_minutes=original.estimated_duration_minutes,
                distance_km=original.distance_km,
                reason=f"risk_score={scored['risk_score']:.4f}",
                traffic=original.traffic,
                weather=original.weather,
            )

        # Match scored results back to original Route objects by shipment_id
        original_map = {r.shipment_id: r for r in request.route_candidates}
        best_original = original_map.get(best["route_id"],
                                         request.route_candidates[0])

        logger.info("OptimizeRoute [shipment=%s] → best=%s",
                    request.shipment_id, best["route_id"])

        return route_pb2.OptimizeRouteResponse(
            shipment_id=request.shipment_id,
            best_route=_to_route(best, best_original),
        )

    def GetRoute(self, request, context):
        # Pass-through — data layer not managed by ML service
        return route_pb2.Route(shipment_id=request.shipment_id)


# ── DisruptionService → AnalyzeShipment ──────────────────────────────────────

class DisruptionServiceServicer(disruption_pb2_grpc.DisruptionServiceServicer):

    def AnalyzeShipment(self, request, context):
        """Use Gemini 2.5 Flash to analyze a shipment's disruption risk."""
        result = analyze_disruption(
            shipment_id=request.shipment_id,
            origin="",           # not in updated proto; Gemini uses conditions
            destination="",
            cargo_type=request.cargo_type,
            current_conditions=request.current_conditions,
        )

        logger.info("AnalyzeShipment [shipment=%s] → risk=%s",
                    request.shipment_id, result["risk_level"])

        return disruption_pb2.AnalyzeShipmentResponse(
            shipment_id=request.shipment_id,
            summary=result["summary"],
            risk_level=result["risk_level"],
            suggested_actions=result["suggested_actions"],
            detailed_analysis=result["detailed_analysis"],
        )
