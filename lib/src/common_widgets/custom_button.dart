import 'package:flutter/material.dart';
import '../utils/colors.dart' as colors;
import '../utils/sizes.dart' as sizes;

class CustomButton extends StatelessWidget {
  const CustomButton({
    required this.text,
    required this.onPressed,
    this.isTextButton = false,
    this.assetImage,
    super.key,
  });

  final String text;
  final VoidCallback onPressed;
  final dynamic assetImage;
  final bool isTextButton;

  @override
  Widget build(final BuildContext context) {
    const double insetSize = 2;

    return !isTextButton
        ? ElevatedButton(
            onPressed: onPressed,
            style: ElevatedButton.styleFrom(
              backgroundColor: colors.detailColor,
              textStyle: const TextStyle(color: colors.primaryColor900),
              padding: assetImage != null
                  ? const EdgeInsets.fromLTRB(
                      insetSize,
                      insetSize,
                      sizes.defaultSize,
                      insetSize,
                    )
                  : const EdgeInsets.fromLTRB(
                      sizes.defaultSize,
                      0,
                      sizes.defaultSize,
                      0,
                    ),
            ),
            child: assetImage != null
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      assetImage,
                      const SizedBox(
                        width: sizes.defaultSize,
                      ),
                      Text(text),
                    ],
                  )
                : Text(text),
          )
        : TextButton(
            style: TextButton.styleFrom(
              foregroundColor: colors.detailColor,
              textStyle: const TextStyle(
                fontSize: sizes.defaultFont,
                color: colors.detailColor,
              ),
            ),
            onPressed: onPressed,
            child: Text(
              text,
            ),
          );
  }
}
