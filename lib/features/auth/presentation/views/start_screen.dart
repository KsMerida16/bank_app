import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:bank_app/theme/themed_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class StartScreen extends ConsumerStatefulWidget {
  const StartScreen({super.key});

  @override
  ConsumerState<StartScreen> createState() => _StartScreenState();
}

class _StartScreenState extends ConsumerState<StartScreen> {
  @override
  void initState() {
    super.initState();
    // Restaura la sesión si Firebase ya tiene un usuario autenticado.
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(signInRiverpodProvider.notifier).checkIfLogged();
    });
  }

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
