import "dart:async";

import "package:grpc/grpc.dart";

import "../../../core/constants.dart";
import "../../../core/grpc_error_mapper.dart";
import "../../../proto/disruption.pb.dart";
import "../../../proto/disruption.pbgrpc.dart";
import "../domain/disruption_model.dart";

class DisruptionRepository {
  DisruptionRepository(this._client);

  final DisruptionServiceClient _client;

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

  Future<List<DisruptionModel>> listDisruptions(ListDisruptionsRequest request) async {
    return _withRetry(() async {
      final response = await _client.listDisruptions(request);
      return response.disruptions.map(DisruptionModel.fromProto).toList();
    });
  }

  Future<AnalyzeShipmentResponse> analyzeShipment(AnalyzeShipmentRequest request) async {
    return _withRetry(() async => _client.analyzeShipment(request));
  }

  Stream<DisruptionAlertModel> watchDisruptions(WatchDisruptionsRequest request) async* {
    while (true) {
      try {
        await for (final alert in _client.watchDisruptions(request)) {
          yield DisruptionAlertModel.fromProto(alert);
        }
        return;
      } on GrpcError catch (error) {
        final mapped = mapGrpcError(error);
        if (!mapped.isTransient) rethrow;
        await Future<void>.delayed(AppConstants.retryBackoff);
      }
    }
  }
}
