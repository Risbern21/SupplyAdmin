import "../../../proto/route.pb.dart" as pb;

class RoutePointModel {
  const RoutePointModel({
    required this.lat,
    required this.lng,
    required this.label,
    required this.sequence,
  });

  final double lat;
  final double lng;
  final String label;
  final int sequence;

  factory RoutePointModel.fromProto(pb.RoutePoint value) {
    return RoutePointModel(
      lat: value.lat,
      lng: value.lng,
      label: value.label,
      sequence: value.sequence,
    );
  }
}

class RouteModel {
  const RouteModel({
    required this.shipmentId,
    required this.points,
    required this.estimatedDurationMinutes,
    required this.distanceKm,
    required this.reason,
  });

  final String shipmentId;
  final List<RoutePointModel> points;
  final double estimatedDurationMinutes;
  final double distanceKm;
  final String reason;

  factory RouteModel.fromProto(pb.Route value) {
    return RouteModel(
      shipmentId: value.shipmentId,
      points: value.points.map(RoutePointModel.fromProto).toList(),
      estimatedDurationMinutes: value.estimatedDurationMinutes,
      distanceKm: value.distanceKm,
      reason: value.reason,
    );
  }
}
