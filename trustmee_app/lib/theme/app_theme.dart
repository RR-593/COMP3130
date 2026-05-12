import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();

  // ─── Colors: Brand ───────────────────────────────────────────────────────────
  static const Color background = Color(0xFF0A0E1A);
  static const Color surface = Color.fromARGB(255, 196, 200, 255);
  static const Color surfaceAlt = Color(0x2088A5F6);
  static const Color accent = Color(0xFF00C896);
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF8B95A8);

  // ─── Colors: iOS Grouped ─────────────────────────────────────────────────────
  static const Color iosGroupedBackground = Color(0xFFF2F2F7);
  static const Color iosCardBackground = Colors.white;
  static const Color iosLabel = Color(0xFF1C1C1E);
  static const Color iosSecondaryLabel = Color(0xFF8E8E93);
  static const Color iosTertiaryLabel = Color(0xFF6D6D72);
  static const Color iosSeparator = Color(0xFFE5E5EA);
  static const Color iosBlue = Color(0xFF007AFF);
  static const Color iosGreen = Color(0xFF34C759);
  static const Color iosRed = Color(0xFFFF3B30);

  // ─── Theme: Dark Brand ───────────────────────────────────────────────────────
  static ThemeData darkBrand() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      colorScheme: ColorScheme.fromSeed(
        seedColor: accent,
        brightness: Brightness.dark,
      ).copyWith(surface: surface),

      // ── Text ──────────────────────────────────────────────────────────────────
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: textPrimary),
        bodyMedium: TextStyle(color: textPrimary),
        bodySmall: TextStyle(color: textSecondary),
      ),

      // ── AppBar ────────────────────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        foregroundColor: textPrimary,
        elevation: 0,
        centerTitle: true,
      ),

      // ── TextField / Input ─────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: surfaceAlt,
        hintStyle: const TextStyle(color: textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: accent, width: 1.5),
        ),
      ),

      // ── ElevatedButton ────────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: accent,
          foregroundColor: Colors.black,
          minimumSize: const Size.fromHeight(52),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── TextButton ────────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: accent),
      ),

      // ── OutlinedButton ────────────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: accent,
          side: const BorderSide(color: accent),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── Card ──────────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: surfaceAlt,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // ── Switch ────────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? accent : textSecondary,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? accent.withValues(alpha: 0.4)
              : textSecondary.withValues(alpha: 0.2),
        ),
      ),

      // ── Divider ───────────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: surfaceAlt,
        thickness: 1,
        space: 1,
      ),

      // ── FloatingActionButton ──────────────────────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: accent,
        foregroundColor: Colors.black,
        shape: CircleBorder(),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: surface,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        titleTextStyle: const TextStyle(
          color: textPrimary,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(color: textSecondary),
      ),
    );
  }

  // ─── Theme: iOS Light ────────────────────────────────────────────────────────
  static ThemeData iosLight() {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      scaffoldBackgroundColor: iosGroupedBackground,

      // ── AppBar ────────────────────────────────────────────────────────────────
      appBarTheme: const AppBarTheme(
        backgroundColor: iosCardBackground,
        foregroundColor: iosLabel,
        elevation: 0,
        centerTitle: true,
      ),

      // ── TextField / Input ─────────────────────────────────────────────────────
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: iosCardBackground,
        hintStyle: const TextStyle(color: iosSecondaryLabel),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: iosSeparator),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: iosSeparator),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: iosBlue, width: 1.5),
        ),
      ),

      // ── ElevatedButton ────────────────────────────────────────────────────────
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: iosBlue,
          foregroundColor: Colors.white,
          minimumSize: const Size.fromHeight(50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── TextButton ────────────────────────────────────────────────────────────
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(foregroundColor: iosBlue),
      ),

      // ── OutlinedButton ────────────────────────────────────────────────────────
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: iosBlue,
          side: const BorderSide(color: iosBlue),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),

      // ── Card ──────────────────────────────────────────────────────────────────
      cardTheme: CardThemeData(
        color: iosCardBackground,
        elevation: 0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),

      // ── Switch ────────────────────────────────────────────────────────────────
      switchTheme: SwitchThemeData(
        thumbColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected) ? Colors.white : Colors.white,
        ),
        trackColor: WidgetStateProperty.resolveWith(
          (states) => states.contains(WidgetState.selected)
              ? iosGreen
              : iosSeparator,
        ),
      ),

      // ── Divider ───────────────────────────────────────────────────────────────
      dividerTheme: const DividerThemeData(
        color: iosSeparator,
        thickness: 0.5,
        space: 0.5,
      ),

      // ── FloatingActionButton ──────────────────────────────────────────────────
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: iosBlue,
        foregroundColor: Colors.white,
        shape: CircleBorder(),
      ),

      // ── Dialog ────────────────────────────────────────────────────────────────
      dialogTheme: DialogThemeData(
        backgroundColor: iosCardBackground,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        titleTextStyle: const TextStyle(
          color: iosLabel,
          fontSize: 17,
          fontWeight: FontWeight.w600,
        ),
        contentTextStyle: const TextStyle(color: iosSecondaryLabel),
      ),
    );
  }
}
