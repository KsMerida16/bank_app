import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/features/auth/state/sign_in_notifier.dart';
import 'package:bank_app/features/auth/state/sign_in_state.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/app_colors.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/theme/themed_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

extension CtxColors on BuildContext {
  AppColors get c => AppColorsScope.of(this);
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: c.background,
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: c.icon,
          tooltip: t.backTooltip,
          onPressed: () => context.pop(),
        ),
        backgroundColor: c.surface,
      ),
      body: const BodyWidget(),
    );
  }
}

class BodyWidget extends ConsumerStatefulWidget {
  const BodyWidget({super.key});

  @override
  ConsumerState<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends ConsumerState<BodyWidget> {
  late bool showPassword;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void initState() {
    showPassword = false;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    MediaQuery.of(context).size.width;
    super.didChangeDependencies();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant BodyWidget oldWidget) {
    showPassword = false;
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final t = AppLocalizations.of(context)!;

    ref.listen<SignInState>(signInRiverpodProvider, (previous, next) {
      if (next is SignInSuccessState) {
        context.goNamed(Routes.dashboard, extra: next);
      } else if (next is SignInErrorState) {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(SnackBar(content: Text(next.errorMessage)));
      }
    });

    return LayoutBuilder(
      builder: (context, constraints) {
        return SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(minHeight: constraints.maxHeight),
            child: IntrinsicHeight(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const HeaderWidget(),
                    const SizedBox(height: 12),
                    Text(
                      t.signInTitle,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                    const SizedBox(height: 24),

                    // Email
                    Text(t.userLabel, style: TextStyle(color: c.textSecondary)),
                    const SizedBox(height: 8),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.email_outlined, size: 20),
                        hintText: t.emailHint,
                      ),
                    ),
                    const SizedBox(height: 20),

                    // Password
                    Text(
                      t.passwordLabel,
                      style: TextStyle(color: c.textSecondary),
                    ),
                    const SizedBox(height: 8),

                    TextField(
                      controller: passwordController,
                      obscureText: !showPassword,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(Icons.lock_outline, size: 20),
                        suffixIcon: IconButton(
                          icon: Icon(
                            showPassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                            size: 20,
                          ),
                          onPressed: () {
                            setState(() {
                              showPassword = !showPassword;
                            });
                          },
                        ),
                        hintText: t.passwordHint,
                      ),
                    ),
                    const SizedBox(height: 28),

                    // Botón primario
                    ElevatedButton(
                      onPressed: () async {
                        final email = emailController.text;
                        final password = passwordController.text;

                        ref
                            .read(signInRiverpodProvider.notifier)
                            .login(email, password);
                      },
                      child: Text(t.signInCta),
                    ),
                    const SizedBox(height: 16),

                    // Texto inferior
                    Center(
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(color: c.textMuted),
                          children: [
                            TextSpan(text: "${t.newUser} "),
                            TextSpan(
                              text: t.newUserLink,
                              style: TextStyle(color: c.primary),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class HeaderWidget extends ConsumerWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    //final title = Provider.of<LoginProvider>(context).title;

    ref.watch(signInRiverpodProvider);

    return const Column(
      mainAxisSize: MainAxisSize.min,
      children: [ThemedLogo(height: 125), SizedBox(height: 12)],
    );
  }
}
