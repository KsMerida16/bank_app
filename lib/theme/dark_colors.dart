import 'package:bank_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class DarkColors implements AppColors {
  @override
  Color get background => const Color(0xFF161622);
  @override
  Color get surface => const Color(0xFF111524);

  @override
  Color get textPrimary => const Color(0xFFF2F4F8);
  @override
  Color get textSecondary => const Color(0xFFB6BECC);
  @override
  Color get textMuted => const Color(0xFF8B93A5);

  @override
  Color get primary => const Color(0xFF1163FF);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get icon => const Color(0xFF8B93A5);
  @override
  Color get divider => const Color(0xFF232836);
  @override
  Color get fieldFill => Colors.transparent;
  @override
  Color get fieldBorder => const Color(0xFF232836);

  @override
  Color get success => const Color(0xFF22C55E);
  @override
  Color get warning => const Color(0xFFEAB308);
  @override
  Color get error => const Color(0xFFF87171);

  @override
  Color get overlay => const Color(0x33FFFFFF);
  @override
  // ignore: deprecated_member_use
  Color? get shadow => Colors.black.withOpacity(0.40);
}
