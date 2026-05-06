import 'package:flutter/material.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/core/navigation/router.dart';
import 'package:go_router/go_router.dart';

class BottomNav extends StatelessWidget {
  final int currentIndex;

  const BottomNav({super.key, required this.currentIndex});

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
            context.goNamed(Routes.dashboard);
            break;
          case 3:
            context.goNamed(Routes.settings);
            break;
          default:
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
