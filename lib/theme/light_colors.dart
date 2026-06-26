import 'package:bank_app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class LightColors implements AppColors {
  @override
  Color get background => const Color(0xFFFFFFFF);
  @override
  Color get surface => const Color(0xFFFFFFFF);

  @override
  Color get textPrimary => const Color(0xFF111317);
  @override
  Color get textSecondary => const Color(0xFF6B7280);
  @override
  Color get textMuted => const Color(0xFF9AA1AC);

  @override
  Color get primary => const Color(0xFF1163FF);
  @override
  Color get onPrimary => const Color(0xFFFFFFFF);
  @override
  Color get icon => const Color(0xFF9AA1AC);
  @override
  Color get divider => const Color(0xFFE5E7EB);
  @override
  Color get fieldFill => Colors.transparent;
  @override
  Color get fieldBorder => const Color(0xFFE5E7EB);

  @override
  Color get success => const Color(0xFF22C55E);
  @override
  Color get warning => const Color(0xFFF59E0B);
  @override
  Color get error => const Color(0xFFEF4444);

  @override
  Color get overlay => const Color(0x14000000);

  @override
  // ignore: deprecated_member_use
  Color? get shadow => Colors.black.withOpacity(0.10);
}
