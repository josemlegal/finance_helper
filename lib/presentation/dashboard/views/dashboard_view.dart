import 'package:flutter/material.dart';

class DashboardView extends StatelessWidget {
  static const String name = '/dashboard-view';

  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
      ),
      body: const Center(
        child: Text('Dashboard'),
      ),
    );
  }
}
