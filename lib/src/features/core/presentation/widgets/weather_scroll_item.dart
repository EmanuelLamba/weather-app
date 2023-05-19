import 'package:flutter/material.dart';

import 'weather_card.dart';
import 'weather_details.dart';

class WeatherScrollItem extends StatelessWidget {
  const WeatherScrollItem({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: const <Widget>[
        WeatherCard(),
        SizedBox(
          height: 32,
        ),
        WeatherDetails(),
      ],
    );
  }
}
