import "package:flutter/material.dart";
import "package:flutter_riverpod/flutter_riverpod.dart";

import "features/disruptions/presentation/disruptions_screen.dart";
import "features/shipments/presentation/shipments_screen.dart";
import "shared/theme/app_theme.dart";

void main() {
  runApp(const ProviderScope(child: SupplyApp()));
}

class SupplyApp extends StatelessWidget {
  const SupplyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Smart Supply Chain",
      theme: AppTheme.light,
      home: const _HomeTabs(),
    );
  }
}

class _HomeTabs extends StatefulWidget {
  const _HomeTabs();

  @override
  State<_HomeTabs> createState() => _HomeTabsState();
}

class _HomeTabsState extends State<_HomeTabs> {
  int _index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = const [ShipmentsScreen(), DisruptionsScreen()];
    return Scaffold(
      body: screens[_index],
      bottomNavigationBar: NavigationBar(
        selectedIndex: _index,
        onDestinationSelected: (value) => setState(() => _index = value),
        destinations: const [
          NavigationDestination(icon: Icon(Icons.local_shipping), label: "Shipments"),
          NavigationDestination(icon: Icon(Icons.warning_amber), label: "Disruptions"),
        ],
      ),
    );
  }
}
