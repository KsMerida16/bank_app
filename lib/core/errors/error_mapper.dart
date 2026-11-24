import 'package:bank_app/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';

/// Traduce cualquier excepción de infraestructura a un [Failure] tipado.
///
/// Es idempotente: si ya recibe un [Failure], lo devuelve tal cual.
/// [context] describe la operación (p. ej. "cargar movimientos") y se antepone
/// a los errores no clasificados.
Failure mapToFailure(Object error, {String? context}) {
  if (error is Failure) return error;

  if (error is FirebaseAuthException) {
    return AuthFailure(
      _authMessage(error),
      code: error.code,
      cause: error,
    );
  }

  if (error is FirebaseException) {
    switch (error.code) {
      case 'permission-denied':
      case 'unauthenticated':
        return PermissionFailure(
          'No tienes permiso para realizar esta operación.',
          cause: error,
        );
      case 'not-found':
        return NotFoundFailure('No se encontró la información solicitada.',
            cause: error);
      case 'unavailable':
      case 'deadline-exceeded':
        return NetworkFailure(
          'Servicio no disponible. Revisa tu conexión e inténtalo de nuevo.',
          cause: error,
        );
      default:
        return ServerFailure(
          error.message ?? 'Error del servidor (${error.code}).',
          cause: error,
        );
    }
  }

  if (error is DioException) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
      case DioExceptionType.connectionError:
        return NetworkFailure(
          'No se pudo conectar con el servidor. Revisa tu conexión.',
          cause: error,
        );
      default:
        final status = error.response?.statusCode;
        if (status == 401 || status == 403) {
          return PermissionFailure('Sesión no autorizada.', cause: error);
        }
        if (status == 404) {
          return NotFoundFailure('Recurso no encontrado.', cause: error);
        }
        return ServerFailure(
          'Error del servidor${status != null ? ' ($status)' : ''}.',
          statusCode: status,
          cause: error,
        );
    }
  }

  final prefix = context == null ? '' : 'Error al $context: ';
  return UnknownFailure('$prefix$error', cause: error);
}

String _authMessage(FirebaseAuthException e) {
  switch (e.code) {
    case 'user-not-found':
      return 'User not found. Please register first.';
    case 'wrong-password':
      return 'Incorrect password';
    case 'invalid-email':
      return 'Invalid email format';
    case 'invalid-credential':
      return 'Invalid email or password. Please try again.';
    case 'email-already-in-use':
      return 'This email is already registered';
    case 'weak-password':
      return 'Password must be at least 6 characters';
    case 'too-many-requests':
      return 'Too many attempts. Please try again later.';
    case 'network-request-failed':
      return 'Network error. Please check your connection.';
    default:
      return e.message ?? 'Authentication failed';
  }
}
