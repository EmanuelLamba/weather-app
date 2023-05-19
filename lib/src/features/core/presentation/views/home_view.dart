import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// import '../../../../common_widgets/custom_button.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/sizes.dart' as sizes;
import '../widgets/custom_checkbox.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  bool isChecked = false;

  @override
  Widget build(final BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(sizes.defaultSize),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            isChecked ? '5 Days Forecast' : 'Current Weather',
            style: const TextStyle(fontSize: sizes.bigFont),
          ),
          const SizedBox(
            height: 32,
          ),
          TextField(
            decoration: InputDecoration(
              suffixIcon: CustomCheckBox(
                isChecked: isChecked,
                onTap: () => setState(
                  () {
                    isChecked = !isChecked;
                  },
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 32,
          ),
          CustomButton(
            text: 'Search',
            onPressed: () {
              context.go('/weather-result');
            },
          ),
        ],
      ),
    );
  }
}
