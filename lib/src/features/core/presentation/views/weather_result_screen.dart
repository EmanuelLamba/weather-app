import 'package:flutter/material.dart';

import '../../../../common_widgets/app_bar_spacing.dart';
import '../../../../common_widgets/custom_back_button.dart';
import '../../../../utils/colors.dart';
import '../widgets/weather_scroll_container.dart';

class WeatherResultScreen extends StatelessWidget {
  const WeatherResultScreen({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: <Widget>[
        const AppBarSpacing(),
        Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const <Widget>[
              CustomBackButton(),
              Icon(
                Icons.notifications,
                color: detailColor,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 32,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            Icon(Icons.location_on),
            Text(
              'Pitesti',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
            ),
          ],
        ),
        const SizedBox(
          height: 24,
        ),
        const Text('Sun Dec 01 2019'),
        const SizedBox(
          height: 48,
        ),
        const WeatherScrollContaier(),
      ],
    );
  }
}
