import "package:flutter_riverpod/flutter_riverpod.dart";

import "../core/grpc_client.dart";
import "../proto/disruption.pb.dart";
import "../proto/disruption.pbgrpc.dart";
import "../proto/route.pb.dart";
import "../proto/route.pbgrpc.dart";
import "../proto/shipment.pb.dart";
import "../proto/shipment.pbgrpc.dart";
import "disruptions/data/disruption_repository.dart";
import "disruptions/domain/disruption_model.dart";
import "routes/data/route_repository.dart";
import "routes/domain/route_model.dart";
import "shipments/data/shipment_repository.dart";
import "shipments/domain/shipment_model.dart";

final ownerIdProvider = Provider<String>((ref) => "demo-owner-001");

final shipmentRepositoryProvider = Provider<ShipmentRepository>(
  (ref) => ShipmentRepository(ShipmentServiceClient(GrpcClient.channel)),
);

final disruptionRepositoryProvider = Provider<DisruptionRepository>(
  (ref) => DisruptionRepository(DisruptionServiceClient(GrpcClient.channel)),
);

final routeRepositoryProvider = Provider<RouteRepository>(
  (ref) => RouteRepository(RouteServiceClient(GrpcClient.channel)),
);

final shipmentsProvider = FutureProvider<List<ShipmentModel>>((ref) {
  final repo = ref.watch(shipmentRepositoryProvider);
  final ownerId = ref.watch(ownerIdProvider);
  return repo.listShipments(ListShipmentsRequest(ownerId: ownerId));
});

final disruptionsProvider = FutureProvider<List<DisruptionModel>>((ref) {
  final repo = ref.watch(disruptionRepositoryProvider);
  return repo.listDisruptions(ListDisruptionsRequest());
});

final watchDisruptionsProvider = StreamProvider<DisruptionAlertModel>((ref) {
  final repo = ref.watch(disruptionRepositoryProvider);
  final ownerId = ref.watch(ownerIdProvider);
  return repo.watchDisruptions(WatchDisruptionsRequest(ownerId: ownerId));
});

final trackShipmentProvider =
    StreamProvider.family<ShipmentStatusUpdateModel, String>((ref, shipmentId) {
      final repo = ref.watch(shipmentRepositoryProvider);
      return repo.trackShipment(GetShipmentRequest(id: shipmentId));
    });

final routeProvider = FutureProvider.family<RouteModel, String>((ref, shipmentId) {
  final repo = ref.watch(routeRepositoryProvider);
  return repo.getRoute(GetRouteRequest(shipmentId: shipmentId));
});
