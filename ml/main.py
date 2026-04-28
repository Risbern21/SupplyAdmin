"""
ML gRPC Server — Entry Point

Starts a Python gRPC server on port 50051 serving the MLService
(risk prediction, route optimization, Gemini disruption analysis).
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

from ml.gen import ml_service_pb2_grpc
from ml.services.prediction_service import MLServiceServicer

PORT = os.environ.get("ML_SERVICE_PORT", "50051")
MAX_WORKERS = int(os.environ.get("ML_MAX_WORKERS", "10"))

logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s — %(message)s",
)
logger = logging.getLogger("ml.server")


def serve():
    """Create, configure, and run the gRPC server."""
    server = grpc.server(futures.ThreadPoolExecutor(max_workers=MAX_WORKERS))

    ml_service_pb2_grpc.add_MLServiceServicer_to_server(
        MLServiceServicer(), server
    )

    server.add_insecure_port(f"[::]:{PORT}")
    server.start()

    logger.info("🚀 ML gRPC server listening on port %s", PORT)

    # Graceful shutdown on SIGTERM / SIGINT
    stop_event = server.wait_for_termination

    def _shutdown(signum, frame):
        logger.info("Received signal %s — shutting down gracefully…", signum)
        server.stop(grace=5)

    signal.signal(signal.SIGTERM, _shutdown)
    signal.signal(signal.SIGINT, _shutdown)

    stop_event()


if __name__ == "__main__":
    serve()
