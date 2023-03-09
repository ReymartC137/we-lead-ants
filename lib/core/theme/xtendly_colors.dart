import 'package:flutter/material.dart';

abstract class WeLeadColors {
  static const int _primaryValue = 0xFF00B5FF;
  static const MaterialColor primary =
      MaterialColor(_primaryValue, <int, Color>{
    50: Color(0xFFE0F6FF),
    100: Color(0xFFB3E9FF),
    200: Color(0xFF80DAFF),
    300: Color(0xFF4DCBFF),
    400: Color(0xFF26C0FF),
    500: Color(_primaryValue),
    600: Color(0xFF00AEFF),
    700: Color(0xFF00A5FF),
    800: Color(0xFF009DFF),
    900: Color(0xFF008DFF),
  });
  static const primaryDark = Color(0xff23a9e1);
  static const background = Color(0xff000000);
  static const foreground = Color(0xffFFFFFF);
  static const semiWhite = Color(0xffF2F2F2);
  static const grey = Color(0xff808080);
  static const accent = Color(0xffF9E084);
  static const primaryPaint = Color(0xff52b47b);
  static const orangepaint = Color(0xffffc19a);
  static const redPaint = Color(0xfff18382);
  static const bluePaint = Color(0xff91c8e7);

  static const linearGradientPrimary = LinearGradient(
    colors: [
      primary,
      bluePaint,
    ],
  );
  static const linearGradientSecondary = LinearGradient(
    colors: [
      primaryDark,
      accent,
    ],
  );
}
