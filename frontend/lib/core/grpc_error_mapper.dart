import "package:grpc/grpc.dart";

class GrpcException implements Exception {
  const GrpcException(this.message, {this.isTransient = false});

  final String message;
  final bool isTransient;

  @override
  String toString() => message;
}

GrpcException mapGrpcError(GrpcError error) {
  switch (error.code) {
    case StatusCode.unavailable:
      return const GrpcException(
        "Service is temporarily unavailable. Please retry.",
        isTransient: true,
      );
    case StatusCode.unauthenticated:
      return const GrpcException(
        "Session expired. Please sign in again.",
      );
    case StatusCode.notFound:
      return const GrpcException(
        "Requested item was not found.",
      );
    default:
      return GrpcException(error.message ?? "Unexpected network error.");
  }
}
