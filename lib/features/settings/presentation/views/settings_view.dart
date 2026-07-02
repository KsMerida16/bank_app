import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/widgets/bottom_nav.dart';
import 'package:bank_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bank_app/features/settings/presentation/state/language_provider.dart';

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
    String? routeName,
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
        if (routeName != null) {
          context.pushNamed(routeName);
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;
    final bg = _blend(c.surface, Colors.white.withValues(alpha: 0.03));
    final languageState = ref.watch(
      languageNotifierProvider,
    ); 
    final currentLanguageLabel = languageState.locale.languageCode == 'es'
        ? t.spanish
        : t.english;

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
                  trailing: currentLanguageLabel,
                  routeName: Routes.language,
                ),

                const Divider(color: Colors.white10),

                settingsItem(context, t.myProfile, routeName: Routes.profile),

                const Divider(color: Colors.white10),

                settingsItem(context, t.contactus, routeName: Routes.contact),
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
                  routeName: Routes.changePassword,
                ),

                const Divider(color: Colors.white10),

                settingsItem(
                  context,
                  t.privatePolicy,
                  routeName: Routes.privacy,
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
