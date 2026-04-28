import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "../../../shared/widgets/error_view.dart";
import "../../../shared/widgets/loading_indicator.dart";
import "../../app_providers.dart";
import "widgets/route_polyline_widget.dart";

class RouteMapScreen extends ConsumerWidget {
  const RouteMapScreen({required this.shipmentId, super.key});

  final String shipmentId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final routeValue = ref.watch(routeProvider(shipmentId));
    return Scaffold(
      appBar: AppBar(title: Text("Route for $shipmentId")),
      body: routeValue.when(
        data: (route) => RoutePolylineWidget(route: route),
        loading: () => const LoadingIndicator(),
        error: (error, _) => ErrorView(
          message: error.toString(),
          onRetry: () => ref.invalidate(routeProvider(shipmentId)),
        ),
      ),
    );
  }
}
