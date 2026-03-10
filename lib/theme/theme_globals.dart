import 'package:flutter/material.dart';

/// Variable global para el modo de tema.
final ValueNotifier<ThemeMode> themeModeNotifier = ValueNotifier<ThemeMode>(
  ThemeMode.system,
);

/// Helper global para cambiar el tema desde cualquier parte.
void setThemeMode(ThemeMode mode) {
  if (themeModeNotifier.value == mode) return;
  themeModeNotifier.value = mode;
}
