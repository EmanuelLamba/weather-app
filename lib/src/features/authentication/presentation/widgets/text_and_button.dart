// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../common_widgets/custom_button.dart';
import '../../../../utils/sizes.dart' as sizes;

class TextAndButton extends StatelessWidget {
  const TextAndButton({
    required this.text,
    required this.buttonText,
    required this.onPressed,
    super.key,
  });

  final String text;
  final String buttonText;
  final VoidCallback onPressed;

  @override
  Widget build(final BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          text,
          style: const TextStyle(fontSize: sizes.defaultFont),
        ),
        CustomButton(
          text: buttonText,
          onPressed: onPressed,
          isTextButton: true,
        ),
      ],
    );
  }
}
