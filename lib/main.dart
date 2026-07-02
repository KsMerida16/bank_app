import 'package:bank_app/core/environment/env.dart';
import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/core/utils/local_storage.dart';
import 'package:bank_app/features/settings/presentation/state/language_provider.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/app_theme.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/theme/dark_colors.dart';
import 'package:bank_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.initialize();
  await LocalStorage().init();
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = LightColors();
    final dark = DarkColors();
    final router = ref.watch(goRouterProvider);
    final language = ref.watch(languageNotifierProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: buildTheme(light, brightness: Brightness.light),
      darkTheme: buildTheme(dark, brightness: Brightness.dark),
      routerConfig: router,
      builder: (context, child) {
        return AppColorsScope(colors: dark, child: child ?? const SizedBox());
      },
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      locale: language.locale,
      supportedLocales: const [Locale('en'), Locale('es')],
    );
  }
}
