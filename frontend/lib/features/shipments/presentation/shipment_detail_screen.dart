import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../proto/disruption.pb.dart";
import "../../../shared/widgets/error_view.dart";
import "../../../shared/widgets/loading_indicator.dart";
import "../../app_providers.dart";
import "widgets/shipment_status_badge.dart";

class ShipmentDetailScreen extends ConsumerWidget {
  const ShipmentDetailScreen({required this.shipmentId, super.key});

  final String shipmentId;

  Future<void> _analyzeShipment(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    try {
      final response = await ref.read(disruptionRepositoryProvider).analyzeShipment(
        AnalyzeShipmentRequest(shipmentId: shipmentId),
      );
      if (!context.mounted) return;

      final summary = response.risks.isEmpty
          ? "No disruption risks found."
          : "Found ${response.risks.length} risk(s).";

      await showDialog<void>(
        context: context,
        builder: (dialogContext) => AlertDialog(
          title: const Text("Analysis Complete"),
          content: Text(
            response.rerouted
                ? "$summary Shipment was rerouted."
                : "$summary Shipment was not rerouted.",
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(dialogContext).pop(),
              child: const Text("OK"),
            ),
          ],
        ),
      );

      ref.invalidate(disruptionsProvider);
    } catch (error) {
      if (!context.mounted) return;
      messenger.showSnackBar(
        SnackBar(content: Text("Failed to analyze shipment: $error")),
      );
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final streamValue = ref.watch(trackShipmentProvider(shipmentId));
    final isAnalyzing = ref.watch(_analyzeShipmentProvider(shipmentId));

    return Scaffold(
      appBar: AppBar(
        title: Text("Shipment $shipmentId"),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8),
            child: FilledButton.icon(
              onPressed: isAnalyzing
                  ? null
                  : () async {
                      ref.read(_analyzeShipmentProvider(shipmentId).notifier).state = true;
                      await _analyzeShipment(context, ref);
                      if (context.mounted) {
                        ref.read(_analyzeShipmentProvider(shipmentId).notifier).state = false;
                      }
                    },
              icon: isAnalyzing
                  ? const SizedBox(
                      width: 16,
                      height: 16,
                      child: CircularProgressIndicator(strokeWidth: 2),
                    )
                  : const Icon(Icons.analytics),
              label: const Text("Analyze"),
            ),
          ),
        ],
      ),
      body: streamValue.when(
        data: (update) => Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ShipmentStatusBadge(status: update.status),
              const SizedBox(height: 12),
              Text("Lat: ${update.currentLocation.lat}"),
              Text("Lng: ${update.currentLocation.lng}"),
              const SizedBox(height: 8),
              Text("Updated: ${update.updatedAt}"),
            ],
          ),
        ),
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(trackShipmentProvider(shipmentId)),
        ),
      ),
    );
  }
}

final _analyzeShipmentProvider =
    StateProvider.family<bool, String>((ref, shipmentId) => false);
