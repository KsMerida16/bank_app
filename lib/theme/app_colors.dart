import 'package:flutter/material.dart';

abstract class AppColors {
  // Fondos
  Color get background;
  Color get surface;

  // Texto
  Color get textPrimary;
  Color get textSecondary;
  Color get textMuted;

  // Controles
  Color get primary;
  Color get onPrimary;
  Color get icon;
  Color get divider;
  Color get fieldFill;
  Color get fieldBorder;

  // Estados
  Color get success;
  Color get warning;
  Color get error;

  // Utilidades
  Color get overlay;
  Color? get shadow;
}
