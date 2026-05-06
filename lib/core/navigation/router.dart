import 'package:bank_app/features/auth/presentation/sign_in_screen.dart';
import 'package:bank_app/features/auth/state/sign_in_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/transfers/presentation/transfer_view.dart';
import 'package:bank_app/features/history/presentation/history_page.dart';
import 'package:bank_app/features/settings/presentation/settings_view.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(signInRiverpodProvider).logged;

  return GoRouter(
    initialLocation: '/login',

    redirect: (context, state) {
      final loggingIn = state.matchedLocation == '/';

      if (!isLoggedIn && !loggingIn) {
        return '/';
      }

      if (isLoggedIn && loggingIn) {
        return Routes.dashboard;
      }

      return null;
    },

    routes: [
      GoRoute(path: '/', builder: (_, _) => const SignInPage()),
      GoRoute(
        name: Routes.dashboard,
        path: '/dashboard',
        builder: (_, _) => const HomeDashboardPage(),
      ),
      GoRoute(
        name: Routes.transfer,
        path: '/transfer',
        builder: (_, _) => const TransferPage(),
      ),
      GoRoute(
        name: Routes.history,
        path: '/history',
        builder: (_, _) => const HistoryPage(),
      ),
      GoRoute(
        name: Routes.settings,
        path: '/settings',
        builder: (_, _) => const SettingsPage(),
      ),
      GoRoute(
        name: Routes.signin,
        path: '/signin',
        builder: (_, _) => const SignInPage(),
      ),
    ],
  );
});

abstract class Routes {
  static const String dashboard = 'dashboard';
  static const String transfer = 'transfer';
  static const String history = 'history';
  static const String settings = 'settings';
  static const String signin = 'signin';
}
