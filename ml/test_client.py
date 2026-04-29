"""
Test client for the restructured ML gRPC server.
Tests all three servicers against their new proto shapes.
"""

import sys
import os
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

import grpc
from ml.gen import (
    shipment_pb2, shipment_pb2_grpc,
    route_pb2, route_pb2_grpc,
    disruption_pb2, disruption_pb2_grpc,
)

ADDR = "localhost:50051"


def test_predict_risk():
    print("=" * 60)
    print("TEST 1: ShipmentService.PredictRisk")
    print("=" * 60)
    channel = grpc.insecure_channel(ADDR)
    stub = shipment_pb2_grpc.ShipmentServiceStub(channel)

    resp = stub.PredictRisk(shipment_pb2.PredictRiskRequest(
        id="SHIP-001",
        weather_severity=0.9,
        traffic_density=0.8,
        route_congestion=0.7,
        distance_remaining=200,
        time_of_day=18,
        day_of_week=3,
        vehicle_speed=35,
    ))
    print(f"  Risk Score : {resp.risk_score:.4f}")
    print(f"  Risk Level : {resp.risk_level}")
    channel.close()
    print()


def test_optimize_route():
    print("=" * 60)
    print("TEST 2: RouteService.OptimizeRoute")
    print("=" * 60)
    channel = grpc.insecure_channel(ADDR)
    stub = route_pb2_grpc.RouteServiceStub(channel)

    resp = stub.OptimizeRoute(route_pb2.OptimizeRouteRequest(
        shipment_id="SHIP-001",
        route_candidates=[
            route_pb2.Route(shipment_id="A", distance_km=120, traffic="0.8", weather="0.7"),
            route_pb2.Route(shipment_id="B", distance_km=140, traffic="0.4", weather="0.3"),
            route_pb2.Route(shipment_id="C", distance_km=160, traffic="0.3", weather="0.2"),
        ]
    ))
    print(f"  Best Route : {resp.best_route.shipment_id} ({resp.best_route.reason})")
    channel.close()
    print()


def test_analyze_shipment():
    print("=" * 60)
    print("TEST 3: DisruptionService.AnalyzeShipment (Gemini 2.5 Flash)")
    print("=" * 60)
    channel = grpc.insecure_channel(ADDR)
    stub = disruption_pb2_grpc.DisruptionServiceStub(channel)

    try:
        resp = stub.AnalyzeShipment(disruption_pb2.AnalyzeShipmentRequest(
            shipment_id="SHIP-001",
            cargo_type="Electronics",
            current_conditions="Severe cyclone warning. Port congestion at origin.",
        ))
        print(f"  Summary    : {resp.summary}")
        print(f"  Risk Level : {resp.risk_level}")
        print(f"  Actions    : {list(resp.suggested_actions)}")
    except grpc.RpcError as e:
        print(f"  ⚠ {e.code()} — {e.details()}")
    channel.close()
    print()


if __name__ == "__main__":
    test_predict_risk()
    test_optimize_route()
    test_analyze_shipment()
    print("✅ All tests completed!")
