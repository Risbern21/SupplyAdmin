import "package:flutter/material.dart";

import "../../domain/disruption_model.dart";
import "severity_indicator.dart";

class DisruptionAlertCard extends StatelessWidget {
  const DisruptionAlertCard({required this.alert, super.key});

  final DisruptionAlertModel alert;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.red.shade50,
      child: ListTile(
        leading: SeverityIndicator(severity: alert.risk.severity),
        title: Text("Shipment ${alert.shipmentId}: ${alert.risk.type}"),
        subtitle: Text("${alert.risk.description}\nAction: ${alert.suggestedAction}"),
      ),
    );
  }
}
