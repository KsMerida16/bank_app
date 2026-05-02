import 'package:bank_app/core/network/api_client.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/presentation/screens/dashboard_screen.dart';
import 'package:bank_app/theme/app_colors.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/theme/themed_logo.dart';
import 'package:flutter/material.dart';

extension CtxColors on BuildContext {
  AppColors get c => AppColorsScope.of(this);
}

final api = ApiClient();
void getUsers() async {
  try {
    final response = await api.get("/users");
    // ignore: avoid_print
    print(response.data);
  } catch (e) {
    // ignore: avoid_print
    print(e);
  }
}

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    final c = context.c;
    final t = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          color: c.icon,
          tooltip: t.backTooltip,
          onPressed: () {},
        ),
        backgroundColor: c.surface,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: ListView(
          children: [
            const Column(
              children: [
                SizedBox(height: 12),
                ThemedLogo(height: 125),
                SizedBox(height: 24),
              ],
            ),
            const SizedBox(height: 12),
            Text(
              t.signInTitle,
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 24),

            // Email
            Text(t.emailLabel, style: TextStyle(color: c.textSecondary)),
            const SizedBox(height: 8),
            TextField(
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.email_outlined, size: 20),
                hintText: t.emailHint,
              ),
            ),
            const SizedBox(height: 20),

            // Password
            Text(t.passwordLabel, style: TextStyle(color: c.textSecondary)),
            const SizedBox(height: 8),

            TextField(
              obscureText: true,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock_outline, size: 20),
                suffixIcon: const Icon(Icons.remove_red_eye_outlined, size: 20),
                hintText: t.passwordHint,
              ),
            ),
            const SizedBox(height: 28),

            // Botón primario
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(builder: (_) => const HomeDashboardPage()),
                );
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
      backgroundColor: c.background,
    );
  }
}
