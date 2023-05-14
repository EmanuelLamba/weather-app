import 'package:flutter/material.dart';

import '../common_widgets/decorated_input_border.dart';
import '../utils/colors.dart' as colors;
import '../utils/sizes.dart';

ThemeData lightTheme(final BuildContext context) {
  return ThemeData(fontFamily: 'OpenSans').copyWith(
    inputDecorationTheme: InputDecorationTheme(
      hintStyle: const TextStyle(color: colors.secondaryColor),
      filled: true,
      fillColor: colors.primaryColor900,
      contentPadding: const EdgeInsets.all(defaultSize),
      errorStyle: const TextStyle(fontSize: 13, color: colors.errorColor),
      border: DecoratedInputBorder(
        shadow: const BoxShadow(
          color: Color(0xFFD0D0D0),
          blurRadius: 15,
          offset: Offset(0, 4),
        ),
        child: const OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(50),
          ),
          borderSide: BorderSide.none,
        ),
      ),
    ),
    primaryColor: colors.primaryColor,
    scaffoldBackgroundColor: colors.primaryColor,
  );
}
