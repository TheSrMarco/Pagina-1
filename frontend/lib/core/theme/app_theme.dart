import 'package:flutter/material.dart';

class AppTheme {
  static const brand = Color(0xFF4F46E5);

  static final light = ThemeData(
    colorScheme: ColorScheme.fromSeed(seedColor: brand),
    scaffoldBackgroundColor: const Color(0xFFF8FAFC),
    useMaterial3: true,
  );

  static final dark = ThemeData(
    colorScheme: ColorScheme.fromSeed(
      seedColor: brand,
      brightness: Brightness.dark,
    ),
    useMaterial3: true,
  );
}
