import "package:flutter/material.dart";

import "../../domain/shipment_model.dart";
import "shipment_status_badge.dart";

class ShipmentCard extends StatelessWidget {
  const ShipmentCard({
    required this.shipment,
    required this.onTap,
    super.key,
  });

  final ShipmentModel shipment;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text("Shipment ${shipment.id}"),
        subtitle: Text(
          "${shipment.origin.name} -> ${shipment.destination.name}\nCarrier: ${shipment.carrier}",
        ),
        trailing: ShipmentStatusBadge(status: shipment.status),
      ),
    );
  }
}
