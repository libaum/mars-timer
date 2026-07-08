import 'package:flutter/material.dart';

class AppTheme {
  static const Color black = Color(0xFF000000);
  static const Color white = Color(0xFFFFFFFF);
  static const Color gray = Color(0xFF808080);
  static const Color darkGray = Color(0xFF404040);

  static const String _fontFamily = 'Outfit';

  static TextStyle get outfitLight => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w300,
      );

  static TextStyle get outfitRegular => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w400,
      );

  static TextStyle get outfitMedium => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w500,
      );

  static TextStyle get outfitThin => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w100,
      );

  static TextStyle get outfitThickerThin => const TextStyle(
        fontFamily: _fontFamily,
        fontWeight: FontWeight.w200,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: black,
        colorScheme: const ColorScheme.dark(
          primary: white,
          secondary: white,
          tertiary: white,
          surface: black,
          onPrimary: black,
          onSecondary: black,
          onTertiary: black,
          onSurface: white,
        ),
        textTheme: TextTheme(
          displayLarge: outfitLight.copyWith(fontSize: 57, color: white),
          displayMedium: outfitLight.copyWith(fontSize: 45, color: white),
          titleMedium: outfitMedium.copyWith(fontSize: 16, color: white),
          bodyLarge: outfitRegular.copyWith(
            fontSize: 16,
            color: white,
            height: 1.5,
            letterSpacing: 0.5,
          ),
          labelMedium: outfitMedium.copyWith(
            fontSize: 12,
            color: white,
            letterSpacing: 2,
          ),
        ),
        useMaterial3: true,
      );
}
