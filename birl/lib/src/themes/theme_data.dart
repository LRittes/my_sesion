import 'package:flutter/material.dart';

part 'color_schemes.g.dart';

ThemeData lighttheme = ThemeData(
  useMaterial3: true,
  colorScheme: _lightColorScheme,
  scaffoldBackgroundColor: _lightColorScheme.background,
  floatingActionButtonTheme: FloatingActionButtonThemeData(
    backgroundColor: _lightColorScheme.secondary,
    foregroundColor: _lightColorScheme.onPrimary,
    elevation: 0,
  ),
);

ThemeData darkTheme = ThemeData(
  useMaterial3: true,
  colorScheme: _darkColorScheme,
);
