import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {

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
      title: Text(
        title,
        style: const TextStyle(color: Colors.white),
      ),
      trailing: trailing != null
          ? Text(
              trailing,
              style: const TextStyle(color: Colors.white54),
            )
          : const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.white54),
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
    return Scaffold(
      backgroundColor: const Color(0xFF0F1220),

      appBar: AppBar(
        backgroundColor: const Color(0xFF0F1220),
        elevation: 0,
        centerTitle: true,
        title: const Text(
          "Settings",
          style: TextStyle(color: Colors.white),
        ),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.logout, color: Colors.white),
          )
        ],
      ),

      body: ListView(
        children: [
          sectionTitle("General"),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1F38),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [

                settingsItem(
                  context,
                  "Language",
                  trailing: "English",
                  page: const LanguagePage(),
                ),

                const Divider(color: Colors.white10),

                settingsItem(
                  context,
                  "My Profile",
                  page: const ProfilePage(),
                ),

                const Divider(color: Colors.white10),

                settingsItem(
                  context,
                  "Contact Us",
                  page: const ContactPage(),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),
          sectionTitle("Security"),

          Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: const Color(0xFF1A1F38),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [

                settingsItem(
                  context,
                  "Change Password",
                  page: const ChangePasswordPage(),
                ),

                const Divider(color: Colors.white10),

                settingsItem(
                  context,
                  "Privacy Policy",
                  page: const PrivacyPage(),
                ),

                const Divider(color: Colors.white10),

                ListTile(
                  title: const Text(
                    "Biometric",
                    style: TextStyle(color: Colors.white),
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
                            value
                                ? "Biometric Enabled"
                                : "Biometric Disabled",
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

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xFF1A1F38),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.white54,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card_outlined),
            label: "My Cards",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.pie_chart_outline),
            label: "Statistics",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings_outlined),
            label: "Settings",
          ),
        ],
      ),
    );
  }
}

class LanguagePage extends StatelessWidget {
  const LanguagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Language')),
      body: const Center(child: Text("Language Settings")),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Profile')),
      body: const Center(child: Text("Profile Page")),
    );
  }
}

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Contact Us')),
      body: const Center(child: Text("Contact Page")),
    );
  }
}

class ChangePasswordPage extends StatelessWidget {
  const ChangePasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Change Password')),
      body: const Center(child: Text("Change Password")),
    );
  }
}

class PrivacyPage extends StatelessWidget {
  const PrivacyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Privacy Policy')),
      body: const Center(child: Text("Privacy Policy")),
    );
  }
}