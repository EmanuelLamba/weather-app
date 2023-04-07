import 'package:flutter/material.dart';
import '../utils/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({required this.text, super.key});

  final String text;

  @override
  Widget build(final BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(backgroundColor: detailColor),
      child: Text(text),
    );
  }
}
