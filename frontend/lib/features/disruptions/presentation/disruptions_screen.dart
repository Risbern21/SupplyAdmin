import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../shared/widgets/error_view.dart";
import "../../../shared/widgets/loading_indicator.dart";
import "../../app_providers.dart";
import "../domain/disruption_model.dart";
import "widgets/disruption_alert_card.dart";

class DisruptionsScreen extends ConsumerWidget {
  const DisruptionsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final disruptions = ref.watch(disruptionsProvider);
    return Scaffold(
      appBar: AppBar(title: const Text("Disruptions")),
      body: disruptions.when(
        data: (items) => ListView.builder(
          itemCount: items.length,
          itemBuilder: (context, index) {
            final item = items[index];
            return DisruptionAlertCard(
              alert: DisruptionAlertModel(
                shipmentId: item.shipmentId,
                risk: item,
                suggestedAction: "Monitor and reroute if needed",
                alertTime: item.detectedAt,
              ),
            );
          },
        ),
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(disruptionsProvider),
        ),
      ),
    );
  }
}
