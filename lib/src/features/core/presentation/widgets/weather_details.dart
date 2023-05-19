import 'package:flutter/material.dart';

import 'weather_details_row.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 80,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: const <Widget>[
          WeatherDetailsRow(
            leftText: 'Humidity',
            rightText: '65%',
          ),
          SizedBox(
            height: 24,
          ),
          WeatherDetailsRow(
            leftText: 'UV Index',
            rightText: '7',
          ),
          SizedBox(
            height: 24,
          ),
          WeatherDetailsRow(
            leftText: 'Wind Speed',
            rightText: '5 kmh',
          ),
          SizedBox(
            height: 24,
          ),
          WeatherDetailsRow(
            leftText: 'Rain probability',
            rightText: '2%',
          ),
          SizedBox(
            height: 24,
          ),
          WeatherDetailsRow(
            leftText: 'Pressure',
            rightText: '1023 Pa',
          ),
        ],
      ),
    );
  }
}
