import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/colors.dart' as colors;

class GoogleButton extends StatelessWidget {
  const GoogleButton({required this.onPressed, super.key});

  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) {
    return CustomButton(
      assetImage: Container(
        decoration: const BoxDecoration(
          color: colors.primaryColor900,
          borderRadius: BorderRadius.all(Radius.circular(3)),
        ),
        width: 32,
        child: Image.asset(
          'assets/images/google_icon.png',
        ),
      ),
      text: 'Sign in with Google',
      onPressed: onPressed,
    );
  }
}
