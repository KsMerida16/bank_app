import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/presentation/screens/start_screen.dart';
import 'package:bank_app/theme/app_theme.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:bank_app/theme/dark_colors.dart';
import 'package:bank_app/theme/light_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void main() => runApp(ProviderScope(child: const MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final light = LightColors();
    final dark = DarkColors();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
      theme: buildTheme(light, brightness: Brightness.light),
      darkTheme: buildTheme(dark, brightness: Brightness.dark),
      builder: (context, child) {
        //final isDark = Theme.of(context).brightness == Brightness.dark;
        return AppColorsScope(
          colors: dark, // isDark ? DarkColors() : LightColors(),
          child: child ?? const SizedBox(),
        );
      },

      home: const StartScreen(), //AppColorsScope(
      //   // inyecta tokens según el tema (simple)
      //   colors: dark, // si quieres que cambie automático, ver nota abajo
      //   child: const StartScreen(),
      // ),
      // Delegates requeridos
      localizationsDelegates: const [
        AppLocalizations.delegate, // generado
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],

      // Idiomas soportados
      supportedLocales: const [
        Locale('en'), // Inglés
        Locale('es'), // Español (neutro)
        // Locale('es', 'GT'), // Si quieres español de Guatemala
        // Locale('es', '419'), // Español LATAM
      ],

      locale: const Locale('es'),
    );
  }
}
