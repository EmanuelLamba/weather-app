import 'package:flutter/material.dart';

import '../utils/colors.dart';
import '../utils/sizes.dart';

ThemeData lightTheme(final BuildContext context) {
  return ThemeData(fontFamily: 'OpenSans').copyWith(
    primaryColor: primaryColor,
    scaffoldBackgroundColor: Colors.white,
    inputDecorationTheme: const InputDecorationTheme(
      hintStyle: TextStyle(color: secondaryColor),
      filled: true,
      fillColor: primaryColor900,
      contentPadding: EdgeInsets.all(defaultSize),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(50),
        ),
        borderSide: BorderSide.none,
      ),
    ),
  );
}
