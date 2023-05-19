import 'package:flutter/material.dart';

import '../../../../utils/colors.dart';
import '../../../../utils/sizes.dart';

class CustomCheckBox extends StatelessWidget {
  const CustomCheckBox({
    required this.isChecked,
    required this.onTap,
    super.key,
  });

  final bool isChecked;
  final VoidCallback onTap;

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.only(right: 16),
        child: AnimatedContainer(
          width: 32,
          height: 32,
          curve: Curves.easeInOutQuad,
          duration: const Duration(milliseconds: 250),
          decoration: BoxDecoration(
            border: Border.all(color: detailColor200, width: 2),
            shape: BoxShape.circle,
            color: isChecked
                ? detailColor
                : const Color.fromARGB(19, 119, 119, 119),
            boxShadow: const <BoxShadow>[
              BoxShadow(
                color: shadowColor900,
                blurRadius: 15,
                blurStyle: BlurStyle.outer,
              ),
            ],
          ),
          child: AnimatedOpacity(
            opacity: isChecked ? 1 : 0,
            duration: const Duration(milliseconds: 200),
            child: const Icon(
              Icons.done,
              size: defaultSize,
              color: primaryColor900,
            ),
          ),
        ),
      ),
    );
  }
}
