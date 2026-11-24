/// Errores tipados de la aplicación.
///
/// La capa `data` traduce cualquier excepción de infraestructura (Firebase,
/// Dio, etc.) a un [Failure]; `domain` y `presentation` solo conocen estos
/// tipos. `toString()` devuelve solo el mensaje para poder mostrarlo en la UI.
sealed class Failure implements Exception {
  const Failure(this.message, {this.cause});

  /// Mensaje legible, sin datos sensibles.
  final String message;

  /// Excepción original (solo para diagnóstico/logs).
  final Object? cause;

  @override
  String toString() => message;
}

/// Error de autenticación (credenciales inválidas, correo en uso, etc.).
final class AuthFailure extends Failure {
  const AuthFailure(super.message, {this.code, super.cause});

  /// Código original del proveedor (p. ej. `wrong-password`).
  final String? code;
}

/// Sin conexión, timeout o servicio no disponible.
final class NetworkFailure extends Failure {
  const NetworkFailure(super.message, {super.cause});
}

/// El usuario no tiene permiso (reglas de seguridad / token inválido).
final class PermissionFailure extends Failure {
  const PermissionFailure(super.message, {super.cause});
}

/// El recurso solicitado no existe.
final class NotFoundFailure extends Failure {
  const NotFoundFailure(super.message, {super.cause});
}

/// Error del servidor / backend no clasificado.
final class ServerFailure extends Failure {
  const ServerFailure(super.message, {this.statusCode, super.cause});

  final int? statusCode;
}

/// Cualquier otro error inesperado.
final class UnknownFailure extends Failure {
  const UnknownFailure(super.message, {super.cause});
}
