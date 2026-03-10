import 'package:bank_app/presentation/screens/sign_in_screen.dart';
import 'package:bank_app/theme/themed_logo.dart';
import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: InkWell(
          onTap: () {
            Navigator.of(
              context,
            ).push(MaterialPageRoute(builder: (_) => const SignInPage()));
          },
          child: const ThemedLogo(height: 125),
        ),
      ),
    );
  }
}
