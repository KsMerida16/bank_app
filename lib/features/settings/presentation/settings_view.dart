import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/features/auth/presentation/sign_in_screen.dart';
import 'package:bank_app/features/dashboard/presentation/state/sign_out_notifier.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_screen.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/widgets/bottom_nav.dart';
import 'package:bank_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SettingsPage extends ConsumerStatefulWidget {
  const SettingsPage({super.key});

  @override
  ConsumerState<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends ConsumerState<SettingsPage> {
  bool biometricEnabled = true;

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget settingsItem(
    BuildContext context,
    String title, {
    String? trailing,
    Widget? page,
  }) {
    return ListTile(
      title: Text(title, style: const TextStyle(color: Colors.white)),
      trailing: trailing != null
          ? Text(trailing, style: const TextStyle(color: Colors.white54))
          : const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.white54,
            ),
      onTap: () {
        if (page != null) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => page),
          );
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;
    final bg = _blend(c.surface, Colors.white.withValues(alpha: 0.03));

    return Scaffold(
      backgroundColor: c.background,
      appBar: CustomAppBar(title: t.settings),
      body: ListView(
        children: [
          sectionTitle(t.general),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: bg, //const Color(0xFF1A1F38),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                settingsItem(
                  context,
                  t.language,
                  trailing: t.english,
                  page: const LanguagePage(),
                ),

                const Divider(color: Colors.white10),

                settingsItem(context, t.myProfile, page: const ProfilePage()),

                const Divider(color: Colors.white10),

                settingsItem(context, t.contactus, page: const ContactPage()),
              ],
            ),
          ),

          const SizedBox(height: 20),
          sectionTitle(t.security),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: bg, //const Color(0xFF1A1F38),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                settingsItem(
                  context,
                  t.changePassword,
                  page: const ChangePasswordPage(),
                ),

                const Divider(color: Colors.white10),

                settingsItem(
                  context,
                  t.privatePolicy,
                  page: const PrivacyPage(),
                ),

                const Divider(color: Colors.white10),

                ListTile(
                  title: Text(
                    t.biometric,
                    style: const TextStyle(color: Colors.white),
                  ),
                  trailing: Switch(
                    value: biometricEnabled,
                    onChanged: (value) {
                      setState(() {
                        biometricEnabled = value;
                      });

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            value ? t.biometricEnable : t.biometricDisabled,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const BottomNav(currentIndex: 3),
    );
  }
}

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.language)),
      body: Center(child: Text(t.languageSettings)),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.myProfile)),
      body: Center(child: Text(t.profilePage)),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.contactus)),
      body: Center(child: Text(t.contactPage)),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.changePassword)),
      body: Center(child: Text(t.changePassword)),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      appBar: AppBar(title: Text(t.privatePolicy)),
      body: Center(child: Text(t.privatePolicy)),
    );
  }
}

// Utilidad para mezclar colores con el surface actual (suaviza fondos).
Color _blend(Color base, Color overlay) => Color.alphaBlend(overlay, base);
