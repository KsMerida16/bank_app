import 'package:bank_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

ThemeData buildTheme(AppColors c, {required Brightness brightness}) {
  final scheme = ColorScheme(
    brightness: brightness,
    primary: c.primary,
    onPrimary: c.onPrimary,
    secondary: c.primary,
    onSecondary: c.onPrimary,
    error: c.error,
    onError: c.onPrimary,
    background: c.background,
    onBackground: c.textPrimary,
    surface: c.surface,
    onSurface: c.textPrimary,
  );

  return ThemeData(
    useMaterial3: true,
    colorScheme: scheme,
    scaffoldBackgroundColor: c.background,
    appBarTheme: AppBarTheme(
      backgroundColor: c.surface,
      foregroundColor: c.textPrimary,
      elevation: 0,
    ),
    iconTheme: IconThemeData(color: c.icon),
    dividerColor: c.divider,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: c.primary,
        foregroundColor: c.onPrimary,
        minimumSize: const Size.fromHeight(52),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
    inputDecorationTheme: InputDecorationTheme(
      prefixIconColor: c.icon,
      suffixIconColor: c.icon,
      hintStyle: TextStyle(color: c.textMuted),
      labelStyle: TextStyle(color: c.textSecondary),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: c.fieldBorder, width: 1),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: c.primary, width: 1.4),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: c.error, width: 1.2),
      ),
      focusedErrorBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: c.error, width: 1.4),
      ),
    ),
  );
}
