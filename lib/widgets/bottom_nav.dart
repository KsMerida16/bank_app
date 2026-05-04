import 'package:flutter/material.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/settings/presentation/settings_view.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({
    super.key,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;

    return BottomNavigationBar(
      currentIndex: currentIndex,
      backgroundColor: Colors.transparent,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: c.primary,
      unselectedItemColor: c.textMuted,

      onTap: (index) {
        if (index == currentIndex) return;

        switch (index) {
          case 0:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const HomeDashboardPage(),
              ),
            );
            break;

          case 1:
            // CardsPage
            break;

          case 2:
            // StatisticsPage
            break;

          case 3:
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (_) => const SettingsPage(),
              ),
            );
            break;
        }
      },

      items: [
        BottomNavigationBarItem(
          icon: const Icon(Icons.home_outlined),
          label: t.home,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.credit_card_outlined),
          label: t.myCards,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.pie_chart_outline),
          label: t.statistics,
        ),
        BottomNavigationBarItem(
          icon: const Icon(Icons.settings_outlined),
          label: t.settings,
        ),
      ],
    );
  }
}