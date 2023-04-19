import 'package:flutter/material.dart';

class WidgetDecorator extends StatelessWidget {
  const WidgetDecorator({
    required this.child,
    this.borderRadius = 0,
    super.key,
  });

  final Widget child;
  final double borderRadius;

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        boxShadow: const <BoxShadow>[
          BoxShadow(
            color: Colors.white,
            blurRadius: 15,
            offset: Offset(-10, -10),
          ),
          BoxShadow(
            color: Color(0xFFE0E0E0),
            blurRadius: 15,
            offset: Offset(10, 10),
          ),
        ],
      ),
      child: child,
    );
  }
}
