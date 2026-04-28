"""
gRPC servicer implementing the MLService defined in ml_service.proto.

Bridges the existing RandomForest model and Gemini 2.5 Flash into gRPC RPCs.
"""

import logging
import sys
import os

# Ensure project root is on the path so `ml.*` imports work
sys.path.insert(0, os.path.join(os.path.dirname(__file__), "..", ".."))

from ml.api.predict import predict_risk
from ml.api.route_optimizer import optimize_route
from ml.gen import ml_service_pb2, ml_service_pb2_grpc
from ml.services.gemini_service import analyze_disruption

logger = logging.getLogger(__name__)


class MLServiceServicer(ml_service_pb2_grpc.MLServiceServicer):
    """Implements the MLService gRPC interface."""

    # ── PredictRisk ──────────────────────────────────────────────────────

    def PredictRisk(self, request, context):
        """Run the trained RandomForest model and return a risk score."""
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

        # Classify
        if risk_score >= 0.7:
            risk_level = "HIGH"
        elif risk_score >= 0.4:
            risk_level = "MEDIUM"
        else:
            risk_level = "LOW"

        logger.info("PredictRisk → score=%.4f level=%s", risk_score, risk_level)

        return ml_service_pb2.PredictRiskResponse(
            risk_score=risk_score,
            risk_level=risk_level,
        )

    # ── OptimizeRoute ────────────────────────────────────────────────────

    def OptimizeRoute(self, request, context):
        """Score each route candidate and return the safest one."""
        routes = []
        for c in request.candidates:
            routes.append(
                {
                    "route_id": c.route_id,
                    "distance": c.distance,
                    "traffic": c.traffic,
                    "weather": c.weather,
                }
            )

        best, all_scored = optimize_route(routes)

        def _to_result(r):
            return ml_service_pb2.MLRouteResult(
                route_id=r["route_id"],
                distance=r["distance"],
                traffic=r["traffic"],
                weather=r["weather"],
                risk_score=r["risk_score"],
            )

        logger.info("OptimizeRoute → best=%s", best["route_id"])

        return ml_service_pb2.MLOptimizeRouteResponse(
            best_route=_to_result(best),
            all_routes=[_to_result(r) for r in all_scored],
        )

    # ── AnalyzeDisruption (Gemini 2.5 Flash) ─────────────────────────────

    def AnalyzeDisruption(self, request, context):
        """Delegate to Gemini 2.5 Flash for intelligent disruption analysis."""
        result = analyze_disruption(
            shipment_id=request.shipment_id,
            origin=request.origin,
            destination=request.destination,
            cargo_type=request.cargo_type,
            current_conditions=request.current_conditions,
        )

        logger.info(
            "AnalyzeDisruption → shipment=%s risk=%s",
            request.shipment_id,
            result["risk_level"],
        )

        return ml_service_pb2.AnalyzeDisruptionResponse(
            summary=result["summary"],
            risk_level=result["risk_level"],
            suggested_actions=result["suggested_actions"],
            detailed_analysis=result["detailed_analysis"],
        )
