import "dart:async";

import "package:grpc/grpc.dart";

import "../../../core/constants.dart";
import "../../../core/grpc_error_mapper.dart";
import "../../../proto/shipment.pb.dart";
import "../../../proto/shipment.pbgrpc.dart";
import "../domain/shipment_model.dart";

class ShipmentRepository {
  ShipmentRepository(this._client);

  final ShipmentServiceClient _client;

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

  Future<ShipmentModel> createShipment(CreateShipmentRequest request) async {
    return _withRetry(() async => ShipmentModel.fromProto(await _client.createShipment(request)));
  }

  Future<ShipmentModel> getShipment(GetShipmentRequest request) async {
    return _withRetry(() async => ShipmentModel.fromProto(await _client.getShipment(request)));
  }

  Future<ShipmentModel> updateShipment(UpdateShipmentRequest request) async {
    return _withRetry(() async => ShipmentModel.fromProto(await _client.updateShipment(request)));
  }

  Future<DeleteShipmentResponse> deleteShipment(DeleteShipmentRequest request) async {
    return _withRetry(() async => _client.deleteShipment(request));
  }

  Future<List<ShipmentModel>> listShipments(ListShipmentsRequest request) async {
    return _withRetry(() async {
      final response = await _client.listShipments(request);
      return response.shipments.map(ShipmentModel.fromProto).toList();
    });
  }

  Stream<ShipmentStatusUpdateModel> trackShipment(GetShipmentRequest request) async* {
    while (true) {
      try {
        await for (final event in _client.trackShipment(request)) {
          yield ShipmentStatusUpdateModel.fromProto(event);
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
