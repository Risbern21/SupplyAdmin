"""
ML gRPC Server — Entry Point

Starts a Python gRPC server on port 50051 serving:
  - ShipmentService  → PredictRisk
  - RouteService     → OptimizeRoute
  - DisruptionService→ AnalyzeShipment  (Gemini 2.5 Flash)
"""

import logging
import os
import signal
import sys
from concurrent import futures
from pathlib import Path

import grpc
from dotenv import load_dotenv

# Load .env from the ml/ directory
load_dotenv(Path(__file__).resolve().parent / ".env")

# Ensure project root is on sys.path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), ".."))

from ml.gen import (
    shipment_pb2_grpc,
    route_pb2_grpc,
    disruption_pb2_grpc,
)
from ml.services.prediction_service import (
    ShipmentServiceServicer,
    RouteServiceServicer,
    DisruptionServiceServicer,
)

PORT = os.environ.get("ML_SERVICE_PORT", "50051")
MAX_WORKERS = int(os.environ.get("ML_MAX_WORKERS", "10"))

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s — %(message)s",
)
logger = logging.getLogger("ml.server")


def serve():
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=MAX_WORKERS))

    # Register all three servicers
    shipment_pb2_grpc.add_ShipmentServiceServicer_to_server(
        ShipmentServiceServicer(), server)
    route_pb2_grpc.add_RouteServiceServicer_to_server(
        RouteServiceServicer(), server)
    disruption_pb2_grpc.add_DisruptionServiceServicer_to_server(
        DisruptionServiceServicer(), server)

    server.add_insecure_port(f"[::]:{PORT}")
    server.start()

    logger.info("🚀 ML gRPC server listening on port %s", PORT)
    logger.info("   Services: ShipmentService · RouteService · DisruptionService")

    def _shutdown(signum, frame):
        logger.info("Shutting down gracefully…")
        server.stop(grace=5)

    signal.signal(signal.SIGTERM, _shutdown)
    signal.signal(signal.SIGINT, _shutdown)

    server.wait_for_termination()


if __name__ == "__main__":
    serve()
