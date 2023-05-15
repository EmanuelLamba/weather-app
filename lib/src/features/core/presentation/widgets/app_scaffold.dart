import 'package:flutter/material.dart';

import 'custom_nav_bar.dart';

class AppScaffold extends StatelessWidget {
  const AppScaffold({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: child,
      bottomNavigationBar: const CustomNavBar(),
    );
  }
}
