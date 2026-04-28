import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";
import "package:protobuf/well_known_types/google/protobuf/timestamp.pb.dart";

import "../../../shared/widgets/error_view.dart";
import "../../../shared/widgets/loading_indicator.dart";
import "../../app_providers.dart";
import "../../../proto/shipment.pb.dart";
import "../../disruptions/presentation/widgets/disruption_alert_card.dart";
import "../../routes/presentation/route_map_screen.dart";
import "shipment_detail_screen.dart";
import "widgets/shipment_card.dart";

class ShipmentsScreen extends ConsumerWidget {
  const ShipmentsScreen({super.key});

  Future<void> _openLiveRoute(BuildContext context, WidgetRef ref) async {
    final firstShipment = await ref.read(shipmentsProvider.future);
    if (!context.mounted || firstShipment.isEmpty) return;

    Navigator.of(context).push(
      MaterialPageRoute<void>(
        builder: (_) => RouteMapScreen(shipmentId: firstShipment.first.id),
      ),
    );
  }

  Future<void> _showCreateShipmentDialog(BuildContext context, WidgetRef ref) async {
    final messenger = ScaffoldMessenger.of(context);
    final formKey = GlobalKey<FormState>();
    final carrierController = TextEditingController();
    final originNameController = TextEditingController();
    final originLatController = TextEditingController();
    final originLngController = TextEditingController();
    final destinationNameController = TextEditingController();
    final destinationLatController = TextEditingController();
    final destinationLngController = TextEditingController();
    var estimatedArrival = DateTime.now().add(const Duration(days: 2));
    var isSubmitting = false;

    await showDialog<void>(
      context: context,
      builder: (dialogContext) {
        return StatefulBuilder(
          builder: (context, setState) {
            Future<void> pickEstimatedArrival() async {
              final date = await showDatePicker(
                context: context,
                initialDate: estimatedArrival,
                firstDate: DateTime.now(),
                lastDate: DateTime.now().add(const Duration(days: 365)),
              );
              if (date == null || !context.mounted) return;

              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(estimatedArrival),
              );
              if (time == null) return;

              setState(() {
                estimatedArrival = DateTime(
                  date.year,
                  date.month,
                  date.day,
                  time.hour,
                  time.minute,
                );
              });
            }

            Future<void> submit() async {
              if (!formKey.currentState!.validate()) return;

              setState(() => isSubmitting = true);
              try {
                await ref.read(shipmentRepositoryProvider).createShipment(
                  CreateShipmentRequest(
                    ownerId: ref.read(ownerIdProvider),
                    carrier: carrierController.text.trim(),
                    origin: Location(
                      name: originNameController.text.trim(),
                      lat: double.parse(originLatController.text.trim()),
                      lng: double.parse(originLngController.text.trim()),
                    ),
                    destination: Location(
                      name: destinationNameController.text.trim(),
                      lat: double.parse(destinationLatController.text.trim()),
                      lng: double.parse(destinationLngController.text.trim()),
                    ),
                    estimatedArrival: Timestamp.fromDateTime(estimatedArrival.toUtc()),
                  ),
                );
                ref.invalidate(shipmentsProvider);
                if (!dialogContext.mounted) return;
                Navigator.of(dialogContext).pop();
                messenger.showSnackBar(const SnackBar(content: Text("Shipment created")));
              } catch (error) {
                if (!context.mounted) return;
                messenger.showSnackBar(
                  SnackBar(content: Text("Failed to create shipment: $error")),
                );
                setState(() => isSubmitting = false);
              }
            }

            String? requiredValidator(String? value) {
              if (value == null || value.trim().isEmpty) return "Required";
              return null;
            }

            String? coordinateValidator(String? value) {
              if (value == null || value.trim().isEmpty) return "Required";
              if (double.tryParse(value.trim()) == null) return "Enter a number";
              return null;
            }

            return AlertDialog(
              title: const Text("Add Shipment"),
              content: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        controller: carrierController,
                        decoration: const InputDecoration(labelText: "Carrier"),
                        validator: requiredValidator,
                      ),
                      TextFormField(
                        controller: originNameController,
                        decoration: const InputDecoration(labelText: "Origin"),
                        validator: requiredValidator,
                      ),
                      TextFormField(
                        controller: originLatController,
                        decoration: const InputDecoration(labelText: "Origin latitude"),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        validator: coordinateValidator,
                      ),
                      TextFormField(
                        controller: originLngController,
                        decoration: const InputDecoration(labelText: "Origin longitude"),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        validator: coordinateValidator,
                      ),
                      TextFormField(
                        controller: destinationNameController,
                        decoration: const InputDecoration(labelText: "Destination"),
                        validator: requiredValidator,
                      ),
                      TextFormField(
                        controller: destinationLatController,
                        decoration: const InputDecoration(labelText: "Destination latitude"),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        validator: coordinateValidator,
                      ),
                      TextFormField(
                        controller: destinationLngController,
                        decoration: const InputDecoration(labelText: "Destination longitude"),
                        keyboardType: const TextInputType.numberWithOptions(decimal: true, signed: true),
                        validator: coordinateValidator,
                      ),
                      const SizedBox(height: 12),
                      Row(
                        children: [
                          Expanded(
                            child: Text(
                              "ETA: ${MaterialLocalizations.of(context).formatShortDate(estimatedArrival)} "
                              "${MaterialLocalizations.of(context).formatTimeOfDay(TimeOfDay.fromDateTime(estimatedArrival))}",
                            ),
                          ),
                          TextButton(
                            onPressed: isSubmitting ? null : pickEstimatedArrival,
                            child: const Text("Change"),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: isSubmitting ? null : () => Navigator.of(dialogContext).pop(),
                  child: const Text("Cancel"),
                ),
                FilledButton(
                  onPressed: isSubmitting ? null : submit,
                  child: Text(isSubmitting ? "Saving..." : "Create"),
                ),
              ],
            );
          },
        );
      },
    );

  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final shipments = ref.watch(shipmentsProvider);
    final alert = ref.watch(watchDisruptionsProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Shipments"),
        actions: [
          IconButton(
            onPressed: () => _openLiveRoute(context, ref),
            icon: const Icon(Icons.map),
            tooltip: "Live Route",
          ),
        ],
      ),
      body: Column(
        children: [
          alert.when(
            data: (value) => DisruptionAlertCard(alert: value),
            loading: () => const SizedBox.shrink(),
            error: (_, __) => const SizedBox.shrink(),
          ),
          Expanded(
            child: shipments.when(
              data: (items) => ListView.builder(
                itemCount: items.length,
                itemBuilder: (context, index) {
                  final shipment = items[index];
                  return ShipmentCard(
                    shipment: shipment,
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute<void>(
                          builder: (_) => ShipmentDetailScreen(shipmentId: shipment.id),
                        ),
                      );
                    },
                  );
                },
              ),
              loading: () => const LoadingIndicator(),
              error: (error, _) => ErrorView(
                message: error.toString(),
                onRetry: () => ref.invalidate(shipmentsProvider),
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _showCreateShipmentDialog(context, ref),
        label: const Text("Add Shipment"),
        icon: const Icon(Icons.add),
      ),
    );
  }
}
