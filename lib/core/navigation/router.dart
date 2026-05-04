import 'package:go_router/go_router.dart';
import 'package:bank_app/features/login/presentation/views/login_view.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/transfers/presentation/transfer_view.dart';
import 'package:bank_app/features/history/presentation/history_page.dart';
import 'package:bank_app/features/settings/presentation/settings_view.dart';

final GoRouter appRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(path: '/', builder: (_, _) => const LoginPage()),
    GoRoute(path: '/dashboard', builder: (_, _) => const HomeDashboardPage()),
    GoRoute(path: '/transfer', builder: (_, _) => const TransferPage()),
    GoRoute(path: '/history', builder: (_, _) => const HistoryPage()),
    GoRoute(path: '/settings', builder: (_, _) => const SettingsPage()),
  ],
);