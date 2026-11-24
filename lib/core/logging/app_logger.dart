import 'package:flutter/foundation.dart';

/// Logger central de la aplicación.
///
/// Reglas:
/// - Solo emite en modo debug (`kDebugMode`); en release no imprime nada.
/// - NUNCA debe recibir credenciales, tokens, números de tarjeta ni CVV.
abstract final class AppLogger {
  static void debug(String message) => _log('DEBUG', message);

  static void info(String message) => _log('INFO', message);

  static void warning(String message) => _log('WARN', message);

  static void error(String message, [Object? error, StackTrace? stackTrace]) {
    _log('ERROR', error == null ? message : '$message: $error');
    if (kDebugMode && stackTrace != null) {
      debugPrintStack(stackTrace: stackTrace, maxFrames: 5);
    }
  }

  static void _log(String level, String message) {
    if (!kDebugMode) return;
    debugPrint('[$level] $message');
  }
}
