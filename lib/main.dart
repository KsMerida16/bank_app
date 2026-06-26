import 'package:bank_app/core/environment/env.dart';
import 'package:bank_app/core/navigation/router.dart';
import 'package:bank_app/core/utils/local_storage.dart';
import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/app_theme.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/theme/dark_colors.dart';
import 'package:bank_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void runProject() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await Env.initialize();
  await LocalStorage().init();
  runApp(const ProviderScope(child: MyApp()));
}

class DefaultFirebaseOptions {}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final light = LightColors();
    final dark = DarkColors();
    final router = ref.watch(goRouterProvider);

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
      supportedLocales: const [Locale('en'), Locale('es')],
      locale: const Locale('es'),
    );
  }
}
