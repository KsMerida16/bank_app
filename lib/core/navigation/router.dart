import 'package:bank_app/features/auth/presentation/views/sign_in_screen.dart';
import 'package:bank_app/features/auth/presentation/views/start_screen.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_notifier.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_state.dart';
import 'package:bank_app/features/dashboard/presentation/views/dashboard_view.dart';
import 'package:bank_app/features/history/presentation/views/history_page.dart';
import 'package:bank_app/features/settings/presentation/views/settings_view.dart';
import 'package:bank_app/features/transfers/presentation/views/transfer_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

final goRouterProvider = Provider<GoRouter>((ref) {
  final isLoggedIn = ref.watch(signInRiverpodProvider).logged;

  return GoRouter(
    initialLocation: Routes.startLocation,
    redirect: (context, state) {
      final isAuthRoute =
          state.uri.path == Routes.startLocation ||
          state.uri.path == Routes.signinLocation;

      if (!isLoggedIn && !isAuthRoute) {
        return Routes.startLocation;
      }

      if (isLoggedIn && isAuthRoute) {
        return Routes.dashboardLocation;
      }

      return null;
    },
    routes: [
      GoRoute(path: '/', redirect: (context, state) => Routes.startLocation),
      GoRoute(
        name: Routes.start,
        path: Routes.startLocation,
        builder: (context, state) => const StartScreen(),
      ),
      GoRoute(
        name: Routes.signin,
        path: Routes.signinLocation,
        builder: (context, state) => const SignInPage(),
      ),
      GoRoute(
        name: Routes.dashboard,
        path: Routes.dashboardLocation,
        builder: (context, state) {
          final extra = state.extra;
          late final String userName;
          late final String userGender;
          late final String userImage;

          if (extra is SignInSuccessState) {
            userName = extra.userName;
            userGender = extra.userGender;
            userImage = extra.userImage;
          } else {
            final currentState = ref.read(signInRiverpodProvider);
            if (currentState is SignInSuccessState) {
              userName = currentState.userName;
              userGender = currentState.userGender;
              userImage = currentState.userImage;
            } else {
              userName = 'Usuario';
              userGender = 'male';
              userImage = '';
            }
          }

          return HomeDashboardPage(
            userName: userName,
            userGender: userGender,
            userImage: userImage,
          );
        },
      ),
      GoRoute(
        name: Routes.transfer,
        path: Routes.transferLocation,
        builder: (context, state) => const TransferPage(),
      ),
      GoRoute(
        name: Routes.history,
        path: Routes.historyLocation,
        builder: (context, state) => const HistoryPage(),
      ),
      GoRoute(
        name: Routes.settings,
        path: Routes.settingsLocation,
        builder: (context, state) => const SettingsPage(),
      ),
      GoRoute(
        name: Routes.language,
        path: Routes.languageLocation,
        builder: (context, state) => const LanguagePage(),
      ),
      GoRoute(
        name: Routes.profile,
        path: Routes.profileLocation,
        builder: (context, state) => const ProfilePage(),
      ),
      GoRoute(
        name: Routes.contact,
        path: Routes.contactLocation,
        builder: (context, state) => const ContactPage(),
      ),
      GoRoute(
        name: Routes.changePassword,
        path: Routes.changePasswordLocation,
        builder: (context, state) => const ChangePasswordPage(),
      ),
      GoRoute(
        name: Routes.privacy,
        path: Routes.privacyLocation,
        builder: (context, state) => const PrivacyPage(),
      ),
    ],
  );
});

abstract class Routes {
  static const String start = 'start';
  static const String signin = 'signin';
  static const String dashboard = 'dashboard';
  static const String transfer = 'transfer';
  static const String history = 'history';
  static const String settings = 'settings';
  static const String language = 'language';
  static const String profile = 'profile';
  static const String contact = 'contact';
  static const String changePassword = 'changePassword';
  static const String privacy = 'privacy';

  static const String startLocation = '/start';
  static const String signinLocation = '/signin';
  static const String dashboardLocation = '/dashboard';
  static const String transferLocation = '/transfer';
  static const String historyLocation = '/history';
  static const String settingsLocation = '/settings';
  static const String languageLocation = '/settings/language';
  static const String profileLocation = '/settings/profile';
  static const String contactLocation = '/settings/contact';
  static const String changePasswordLocation = '/settings/changePassword';
  static const String privacyLocation = '/settings/privacy';
}
