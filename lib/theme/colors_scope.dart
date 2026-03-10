import 'package:bank_app/theme/app_colors.dart';
import 'package:flutter/widgets.dart';

class AppColorsScope extends InheritedWidget {
  const AppColorsScope({super.key, required this.colors, required super.child});
  final AppColors colors;

  static AppColors of(BuildContext context) =>
      context.dependOnInheritedWidgetOfExactType<AppColorsScope>()!.colors;

  @override
  bool updateShouldNotify(covariant AppColorsScope oldWidget) =>
      oldWidget.colors.runtimeType != colors.runtimeType;
}

AppColors of(BuildContext context) {
  final c = context
      .dependOnInheritedWidgetOfExactType<AppColorsScope>()
      ?.colors;
  assert(
    c != null,
    'AppColorsScope.of() fue llamado pero no hay AppColorsScope arriba. '
    'Envuelve tu MaterialApp (builder) o la pantalla con AppColorsScope.',
  );
  return c!;
}
