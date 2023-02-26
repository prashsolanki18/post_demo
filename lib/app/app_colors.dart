import 'package:flutter/material.dart';

/// All app colors are defined here
class AppColors {
  AppColors._();

  static MaterialColor primaryPalette = MaterialColor(
    colorE88923.value,
    <int, Color>{
      50: colorE88923.withAlpha(10),
      100: colorE88923.withAlpha(20),
      200: colorE88923.withAlpha(30),
      300: colorE88923.withAlpha(40),
      400: colorE88923.withAlpha(50),
      500: colorE88923.withAlpha(60),
      600: colorE88923.withAlpha(70),
      700: colorE88923.withAlpha(80),
      800: colorE88923.withAlpha(90),
      900: colorE88923.withAlpha(100),
    },
  );

  static const Color colorTransparent = Color(0x00FFFFFF);
  static const Color colorWhite = Color(0xFFFFFFFF);
  static const Color colorE88923 = Color(0xFFE88923);
  static const Color colorE5E5E5 = Color(0xFFE5E5E5);
  static const Color color243F62 = Color(0xFF243F62);
  static const Color color1D1D1F = Color(0xFF1D1D1F);
  static const Color color757575 = Color(0xFF757575);
  static const Color color333333 = Color(0xFF333333);
  static const Color colorF3F3F3 = Color(0xFFF3F3F3);
  static const Color colorShadow = Color(0x00000029);
  static const Color colorShimmerBase = Color(0xFFE0E0E0);
  static const Color colorShimmerHighlight = Color(0xFFF5F5F5);
  static const Color colorShimmer = Color(0xFFBDBDBD);
  static const Color color999999 = Color(0xFF999999);
  static const Color colorF2F3F5 = Color(0xFFF2F3F5);
}
