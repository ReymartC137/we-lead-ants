import 'package:flutter/material.dart';

import 'constants/constants.dart';

class CHTheme {
  static ThemeData get lightTheme => ThemeData(
        primarySwatch: Colors.blue,
        unselectedWidgetColor: CHColor.primaryColor,
        primaryColor: CHColor.primaryColor,
        fontFamily: 'Avenir',
        textButtonTheme: TextButtonThemeData(
          style: TextButton.styleFrom(
            backgroundColor: CHColor.primaryColor,
            fixedSize: const Size(double.infinity, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(6),
            ),
          ),
        ),
        textTheme: const TextTheme(
          titleSmall: TextStyle(
            color: CHColor.black,
            fontSize: CHFontSize.xSmall16,
          ),
          titleMedium: TextStyle(
            color: CHColor.black,
            fontSize: CHFontSize.small18,
            fontWeight: FontWeight.bold,
          ),
          titleLarge: TextStyle(
            color: CHColor.black,
            fontSize: CHFontSize.medium30,
            fontWeight: FontWeight.bold,
          ),
          headlineSmall: TextStyle(
            color: CHColor.black,
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
        ),
      );
}
