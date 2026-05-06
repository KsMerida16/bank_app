import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/theme/themed_logo.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            context.goNamed(Routes.signin);
          },
          child: const ThemedLogo(height: 125),
        ),
      ),
    );
  }
}
