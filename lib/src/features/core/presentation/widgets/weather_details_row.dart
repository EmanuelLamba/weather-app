import 'package:flutter/material.dart';

class WeatherDetailsRow extends StatelessWidget {
  const WeatherDetailsRow({
    required this.leftText,
    required this.rightText,
    super.key,
  });

  final String leftText;
  final String rightText;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Text>[
        Text(leftText),
        Text(rightText),
      ],
    );
  }
}
