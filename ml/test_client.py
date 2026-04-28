"""Quick test client for the ML gRPC service."""

import sys
import os

sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

import grpc
from ml.gen import ml_service_pb2, ml_service_pb2_grpc


def main():
    channel = grpc.insecure_channel("localhost:50051")
    stub = ml_service_pb2_grpc.MLServiceStub(channel)

    # ── Test 1: PredictRisk ──────────────────────────────────────────
    print("=" * 60)
    print("TEST 1: PredictRisk")
    print("=" * 60)
    req = ml_service_pb2.PredictRiskRequest(
        weather_severity=0.9,
        traffic_density=0.8,
        route_congestion=0.7,
        distance_remaining=200,
        time_of_day=18,
        day_of_week=3,
        vehicle_speed=35,
    )
    resp = stub.PredictRisk(req)
    print(f"  Risk Score : {resp.risk_score:.4f}")
    print(f"  Risk Level : {resp.risk_level}")
    print()

    # ── Test 2: OptimizeRoute ────────────────────────────────────────
    print("=" * 60)
    print("TEST 2: OptimizeRoute")
    print("=" * 60)
    req = ml_service_pb2.MLOptimizeRouteRequest(
        candidates=[
            ml_service_pb2.MLRouteCandidate(route_id="A", distance=120, traffic=0.8, weather=0.7),
            ml_service_pb2.MLRouteCandidate(route_id="B", distance=140, traffic=0.4, weather=0.3),
            ml_service_pb2.MLRouteCandidate(route_id="C", distance=160, traffic=0.3, weather=0.2),
        ]
    )
    resp = stub.OptimizeRoute(req)
    print(f"  Best Route : {resp.best_route.route_id} (risk={resp.best_route.risk_score:.4f})")
    print("  All Routes :")
    for r in resp.all_routes:
        print(f"    {r.route_id}: distance={r.distance} risk={r.risk_score:.4f}")
    print()

    # ── Test 3: AnalyzeDisruption (Gemini — may fail without API key) ─
    print("=" * 60)
    print("TEST 3: AnalyzeDisruption (Gemini 2.5 Flash)")
    print("=" * 60)
    try:
        req = ml_service_pb2.AnalyzeDisruptionRequest(
            shipment_id="SHIP-001",
            origin="Mumbai, India",
            destination="Berlin, Germany",
            cargo_type="Electronics",
            current_conditions="Severe cyclone warning in Arabian Sea. Port congestion at origin.",
        )
        resp = stub.AnalyzeDisruption(req)
        print(f"  Summary    : {resp.summary}")
        print(f"  Risk Level : {resp.risk_level}")
        print(f"  Actions    : {list(resp.suggested_actions)}")
        print(f"  Analysis   : {resp.detailed_analysis[:200]}...")
    except grpc.RpcError as e:
        print(f"  ⚠ Gemini RPC failed (expected if no API key): {e.code()} — {e.details()}")

    print()
    print("✅ All tests completed!")
    channel.close()


if __name__ == "__main__":
    main()
