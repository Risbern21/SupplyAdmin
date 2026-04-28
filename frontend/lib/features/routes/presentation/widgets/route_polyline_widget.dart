import "package:flutter/material.dart";
import "package:google_maps_flutter/google_maps_flutter.dart";

import "../../domain/route_model.dart";

class RoutePolylineWidget extends StatelessWidget {
  const RoutePolylineWidget({required this.route, super.key});

  final RouteModel route;

  @override
  Widget build(BuildContext context) {
    final points = route.points
        .map((point) => LatLng(point.lat, point.lng))
        .toList(growable: false);
    return GoogleMap(
      initialCameraPosition: CameraPosition(
        target: points.isNotEmpty ? points.first : const LatLng(0, 0),
        zoom: 10,
      ),
      polylines: {
        Polyline(
          polylineId: const PolylineId("shipment_route"),
          points: points,
          width: 5,
          color: Colors.blue,
        ),
      },
      markers: points
          .asMap()
          .entries
          .map(
            (entry) => Marker(
              markerId: MarkerId("p_${entry.key}"),
              position: entry.value,
            ),
          )
          .toSet(),
    );
  }
}
