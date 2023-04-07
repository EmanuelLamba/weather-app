import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';

class AppBackground extends StatelessWidget {
  const AppBackground({required this.child, super.key});

  final Widget child;

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(defaultSize),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45),
          color: primaryColor,
        ),
        child: child,
      ),
    );
  }
}
