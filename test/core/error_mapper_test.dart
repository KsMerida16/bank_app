import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/errors/failures.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('mapToFailure', () {
    test('es idempotente con un Failure', () {
      const original = NotFoundFailure('x');
      expect(identical(mapToFailure(original), original), isTrue);
    });

    test('FirebaseAuthException -> AuthFailure con código y mensaje', () {
      final failure = mapToFailure(
        FirebaseAuthException(code: 'wrong-password'),
      );

      expect(failure, isA<AuthFailure>());
      expect((failure as AuthFailure).code, 'wrong-password');
      expect(failure.message, 'Incorrect password');
    });

    test('invalid-credential tiene mensaje amigable', () {
      final failure = mapToFailure(
        FirebaseAuthException(code: 'invalid-credential'),
      );

      expect(failure.message, contains('Invalid email or password'));
    });

    test('FirebaseException permission-denied -> PermissionFailure', () {
      final failure = mapToFailure(
        FirebaseException(plugin: 'cloud_firestore', code: 'permission-denied'),
      );

      expect(failure, isA<PermissionFailure>());
    });

    test('FirebaseException unavailable -> NetworkFailure', () {
      final failure = mapToFailure(
        FirebaseException(plugin: 'cloud_firestore', code: 'unavailable'),
      );

      expect(failure, isA<NetworkFailure>());
    });

    test('DioException de timeout -> NetworkFailure', () {
      final failure = mapToFailure(
        DioException(
          requestOptions: RequestOptions(path: '/x'),
          type: DioExceptionType.connectionTimeout,
        ),
      );

      expect(failure, isA<NetworkFailure>());
    });

    test('DioException 404 -> NotFoundFailure y 401 -> PermissionFailure', () {
      DioException withStatus(int status) {
        final options = RequestOptions(path: '/x');
        return DioException(
          requestOptions: options,
          type: DioExceptionType.badResponse,
          response: Response<dynamic>(requestOptions: options, statusCode: status),
        );
      }

      expect(mapToFailure(withStatus(404)), isA<NotFoundFailure>());
      expect(mapToFailure(withStatus(401)), isA<PermissionFailure>());
      final server = mapToFailure(withStatus(500));
      expect(server, isA<ServerFailure>());
      expect((server as ServerFailure).statusCode, 500);
    });

    test('error desconocido -> UnknownFailure con contexto', () {
      final failure = mapToFailure(StateError('boom'), context: 'cargar datos');

      expect(failure, isA<UnknownFailure>());
      expect(failure.message, startsWith('Error al cargar datos:'));
      expect(failure.toString(), failure.message);
    });
  });
}
