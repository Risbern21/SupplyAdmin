import "../../../proto/shipment.pb.dart" as pb;

class ShipmentLocationModel {
  const ShipmentLocationModel({
    required this.lat,
    required this.lng,
    required this.name,
  });

  final double lat;
  final double lng;
  final String name;

  factory ShipmentLocationModel.fromProto(pb.Location value) {
    return ShipmentLocationModel(lat: value.lat, lng: value.lng, name: value.name);
  }
}

class ShipmentModel {
  const ShipmentModel({
    required this.id,
    required this.ownerId,
    required this.origin,
    required this.destination,
    required this.currentLocation,
    required this.routePoints,
    required this.status,
    required this.carrier,
    required this.estimatedArrival,
    required this.createdAt,
  });

  final String id;
  final String ownerId;
  final ShipmentLocationModel origin;
  final ShipmentLocationModel destination;
  final ShipmentLocationModel currentLocation;
  final List<ShipmentLocationModel> routePoints;
  final String status;
  final String carrier;
  final DateTime estimatedArrival;
  final DateTime createdAt;

  factory ShipmentModel.fromProto(pb.Shipment value) {
    return ShipmentModel(
      id: value.id,
      ownerId: value.ownerId,
      origin: ShipmentLocationModel.fromProto(value.origin),
      destination: ShipmentLocationModel.fromProto(value.destination),
      currentLocation: ShipmentLocationModel.fromProto(value.currentLocation),
      routePoints: value.routePoints.map(ShipmentLocationModel.fromProto).toList(),
      status: value.status,
      carrier: value.carrier,
      estimatedArrival: _toDateTime(value.estimatedArrival.seconds.toInt(), value.estimatedArrival.nanos),
      createdAt: _toDateTime(value.createdAt.seconds.toInt(), value.createdAt.nanos),
    );
  }
}

class ShipmentStatusUpdateModel {
  const ShipmentStatusUpdateModel({
    required this.shipmentId,
    required this.status,
    required this.currentLocation,
    required this.updatedAt,
  });

  final String shipmentId;
  final String status;
  final ShipmentLocationModel currentLocation;
  final DateTime updatedAt;

  factory ShipmentStatusUpdateModel.fromProto(pb.ShipmentStatusUpdate value) {
    return ShipmentStatusUpdateModel(
      shipmentId: value.shipmentId,
      status: value.status,
      currentLocation: ShipmentLocationModel.fromProto(value.currentLocation),
      updatedAt: _toDateTime(value.updatedAt.seconds.toInt(), value.updatedAt.nanos),
    );
  }
}

DateTime _toDateTime(int seconds, int nanos) {
  return DateTime.fromMillisecondsSinceEpoch(
    (seconds * 1000) + (nanos ~/ 1000000),
    isUtc: true,
  ).toLocal();
}
