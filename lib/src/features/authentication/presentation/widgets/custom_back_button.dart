import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../utils/colors.dart' as colors;

class CustomBackButton extends StatelessWidget {
  const CustomBackButton({super.key});

  @override
  Widget build(final BuildContext context) {
    final bool isIos = Theme.of(context).platform == TargetPlatform.iOS;

    return Align(
      alignment: Alignment.centerLeft,
      child: IconButton(
        onPressed: context.pop,
        color: colors.detailColor,
        padding: isIos ? const EdgeInsets.only(right: 4) : EdgeInsets.zero,
        icon: isIos
            ? const Icon(Icons.arrow_back_ios_new)
            : const Icon(Icons.arrow_back),
      ),
    );
  }
}
