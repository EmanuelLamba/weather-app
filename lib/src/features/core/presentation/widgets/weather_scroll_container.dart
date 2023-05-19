import 'package:flutter/material.dart';

import 'weather_scroll_item.dart';

class WeatherScrollContaier extends StatelessWidget {
  const WeatherScrollContaier({super.key});

  @override
  Widget build(final BuildContext context) {
    final ScrollController scrollController = ScrollController();
    int currentIndex = 0;

    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      controller: scrollController,
      child: GestureDetector(
        behavior: HitTestBehavior.translucent,
        onHorizontalDragEnd: (final DragEndDetails details) async {
          // print('called');
          bool animate = false;
          print(details.velocity.pixelsPerSecond.dx);
          if (details.velocity.pixelsPerSecond.dx.floorToDouble().isNegative &&
              (currentIndex < 4)) {
            currentIndex++;
            animate = true;
          }
          if (!details.velocity.pixelsPerSecond.dx.floorToDouble().isNegative &&
              (currentIndex > 0)) {
            currentIndex--;
            animate = true;
          }
          if (animate) {
            await scrollController.animateTo(
              (MediaQuery.of(context).size.width - 56) * currentIndex,
              duration: const Duration(milliseconds: 200),
              curve: Curves.easeInOut,
            );
          }
        },
        child: Row(
          children: const <Widget>[
            SizedBox(
              width: 40,
            ),
            WeatherScrollItem(),
            SizedBox(
              width: 24,
            ),
            WeatherScrollItem(),
            SizedBox(
              width: 24,
            ),
            WeatherScrollItem(),
            SizedBox(
              width: 24,
            ),
            WeatherScrollItem(),
            SizedBox(
              width: 24,
            ),
            WeatherScrollItem(),
            SizedBox(
              width: 40,
            ),
          ],
        ),
      ),

      // ),
    );
  }
}
