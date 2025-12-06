import 'package:flutter/material.dart';

abstract class AppTheme {
  static final ThemeData light = ThemeData(
    scaffoldBackgroundColor: const Color(0xFFe3e6fe),
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: _lightColorScheme,
  );

  static const ColorScheme _lightColorScheme = ColorScheme.light(
    surface: Color(0xFFe3e6fe),
    onSurface: Color(0xFFFFFFFF),
    primary: Color(0xFF030212),
    onPrimary: Color(0xFFFFFFFF),
    secondary: Color(0xFF4b5465),
  );
}
