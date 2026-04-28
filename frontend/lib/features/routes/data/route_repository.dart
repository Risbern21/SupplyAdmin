import "package:grpc/grpc.dart";

import "../../../core/constants.dart";
import "../../../core/grpc_error_mapper.dart";
import "../../../proto/route.pb.dart";
import "../../../proto/route.pbgrpc.dart";
import "../domain/route_model.dart";

class RouteRepository {
  RouteRepository(this._client);

  final RouteServiceClient _client;

  Future<T> _withRetry<T>(Future<T> Function() action) async {
    var attempts = 0;
    while (true) {
      try {
        return await action();
      } on GrpcError catch (error) {
        final mapped = mapGrpcError(error);
        if (!mapped.isTransient || attempts >= AppConstants.maxTransientRetries) {
          throw mapped;
        }
        attempts++;
        await Future<void>.delayed(AppConstants.retryBackoff);
      }
    }
  }

  Future<RouteModel> getRoute(GetRouteRequest request) async {
    return _withRetry(() async => RouteModel.fromProto(await _client.getRoute(request)));
  }

  Future<RouteModel> optimizeRoute(OptimizeRouteRequest request) async {
    return _withRetry(() async => RouteModel.fromProto(await _client.optimizeRoute(request)));
  }
}
