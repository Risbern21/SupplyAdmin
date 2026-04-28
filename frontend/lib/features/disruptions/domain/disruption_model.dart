import "../../../proto/disruption.pb.dart" as pb;

class DisruptionModel {
  const DisruptionModel({
    required this.shipmentId,
    required this.type,
    required this.severity,
    required this.description,
    required this.detectedAt,
  });

  final String shipmentId;
  final String type;
  final String severity;
  final String description;
  final DateTime detectedAt;

  factory DisruptionModel.fromProto(pb.DisruptionRisk value) {
    return DisruptionModel(
      shipmentId: value.shipmentId,
      type: value.type,
      severity: value.severity,
      description: value.description,
      detectedAt: _toDateTime(value.detectedAt.seconds.toInt(), value.detectedAt.nanos),
    );
  }
}

class DisruptionAlertModel {
  const DisruptionAlertModel({
    required this.shipmentId,
    required this.risk,
    required this.suggestedAction,
    required this.alertTime,
  });

  final String shipmentId;
  final DisruptionModel risk;
  final String suggestedAction;
  final DateTime alertTime;

  factory DisruptionAlertModel.fromProto(pb.WatchDisruptionsResponse value) {
    return DisruptionAlertModel(
      shipmentId: value.shipmentId,
      risk: DisruptionModel.fromProto(value.risk),
      suggestedAction: value.suggestedAction,
      alertTime: _toDateTime(value.alertTime.seconds.toInt(), value.alertTime.nanos),
    );
  }
}

DateTime _toDateTime(int seconds, int nanos) {
  return DateTime.fromMillisecondsSinceEpoch(
    (seconds * 1000) + (nanos ~/ 1000000),
    isUtc: true,
  ).toLocal();
}
