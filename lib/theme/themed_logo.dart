import 'package:bank_app/core/assets.dart';
import 'package:flutter/material.dart';

class ThemedLogo extends StatelessWidget {
  const ThemedLogo({super.key, this.height = 48});
  final double height;

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final asset = isDark ? Assets.logo_dark : Assets.logo_light;

    return Image.asset(
      asset,
      height: height,
      fit: BoxFit.contain,
      semanticLabel: 'App logo', // i18n si quieres
    );
  }
}
