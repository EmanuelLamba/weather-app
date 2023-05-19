import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../common_widgets/widget_decorator.dart';
import '../../../../utils/colors.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key});

  @override
  Widget build(final BuildContext context) {
    return WidgetDecorator(
      borderRadius: 24,
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 160,
        width: MediaQuery.of(context).size.width - 80,
        decoration: const BoxDecoration(
          color: primaryColor900,
          borderRadius: BorderRadius.all(
            Radius.circular(24),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const <Widget>[
                Text(
                  '23°',
                  style: TextStyle(fontSize: 85, height: 1),
                ),
                SizedBox(
                  height: 16,
                ),
                Text('Real Feel: 20°')
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: <Widget>[
                SvgPicture.asset(
                  'assets/images/weather_icons/Weather_Icons-19.svg',
                  width: 85,
                  height: 85,
                ),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'Overcast',
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
