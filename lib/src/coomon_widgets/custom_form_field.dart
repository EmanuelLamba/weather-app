import 'package:flutter/material.dart';
import 'widget_decorator.dart';

class CustomFormField extends StatelessWidget {
  const CustomFormField({required this.hintText, super.key});
  final String hintText;

  @override
  Widget build(final BuildContext context) {
    return WeidgetDecorator(
      borderRadius: 50,
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
        ),
      ),
    );
  }
}
