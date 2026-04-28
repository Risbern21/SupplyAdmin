import "package:flutter/material.dart";

class SeverityIndicator extends StatelessWidget {
  const SeverityIndicator({required this.severity, super.key});

  final String severity;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 12,
      height: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: switch (severity) {
          "LOW" => Colors.yellow,
          "MEDIUM" => Colors.orange,
          "HIGH" => Colors.red,
          "CRITICAL" => const Color(0xFF8B0000),
          _ => Colors.grey,
        },
      ),
    );
  }
}
