import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // Brand / dark surfaces (login + map)
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color(0xFF0F1629);
  static const Color surfaceAlt = Color(0xFF1A2340);
  static const Color accent = Color(0xFF00C896);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B95A8);

  // iOS-grouped settings palette
  static const Color iosGroupedBackground = Color(0xFFF2F2F7);
  static const Color iosCardBackground = Colors.white;
  static const Color iosLabel = Color(0xFF1C1C1E);
  static const Color iosSecondaryLabel = Color(0xFF8E8E93);
  static const Color iosTertiaryLabel = Color(0xFF6D6D72);
  static const Color iosSeparator = Color(0xFFE5E5EA);
  static const Color iosBlue = Color(0xFF007AFF);
  static const Color iosGreen = Color(0xFF34C759);
  static const Color iosRed = Color(0xFFFF3B30);

  static ThemeData darkBrand() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.dark,
      ).copyWith(surface: surface),
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textPrimary),
        bodySmall: TextStyle(color: textSecondary),
      ),
    );
  }

  static ThemeData iosLight() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: iosGroupedBackground,
      appBarTheme: const AppBarTheme(
        backgroundColor: iosCardBackground,
        foregroundColor: iosLabel,
        elevation: 0,
        centerTitle: true,
      ),
    );
  }
}
