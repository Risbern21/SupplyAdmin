import "package:flutter/material.dart";

class ShipmentStatusBadge extends StatelessWidget {
  const ShipmentStatusBadge({required this.status, super.key});

  final String status;

  @override
  Widget build(BuildContext context) {
    return Chip(
      label: Text(status),
      backgroundColor: switch (status) {
        "IN_TRANSIT" => Colors.blue.shade100,
        "DELAYED" => Colors.orange.shade100,
        "AT_RISK" => Colors.red.shade100,
        _ => Colors.grey.shade300,
      },
    );
  }
}
