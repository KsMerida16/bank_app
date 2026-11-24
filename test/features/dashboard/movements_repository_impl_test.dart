import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/features/dashboard/data/data_sources/firebase_movements_data_source.dart';
import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:bank_app/features/dashboard/data/repositories/movements_repository_impl.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovementsDataSource extends Mock
    implements FirebaseMovementsDataSource {}

void main() {
  late MockMovementsDataSource dataSource;
  late MovementsRepositoryImpl repository;

  setUp(() {
    dataSource = MockMovementsDataSource();
    repository = MovementsRepositoryImpl(movementsDataSource: dataSource);
  });

  test('convierte modelos a entidades de dominio', () async {
    when(() => dataSource.getMovementsByPage('uid-1', 2, '')).thenAnswer(
      (_) async => const [
        MovementModel(
          date: '2026-01-01',
          timestamp: 't1',
          description: 'Compra',
          amount: 10,
          type: 'POS',
          sign: 'D',
          category: 'Comercio',
        ),
      ],
    );

    final result = await repository.getMovementsByPage('uid-1', 2, '');

    expect(result, hasLength(1));
    expect(result.first.description, 'Compra');
    expect(result.first.amount, 10);
  });

  test('traduce errores de Firestore a Failure tipado', () async {
    when(() => dataSource.getMovementsByPage(any(), any(), any())).thenThrow(
      FirebaseException(plugin: 'cloud_firestore', code: 'permission-denied'),
    );

    await expectLater(
      repository.getMovementsByPage('uid-1', 2, ''),
      throwsA(isA<PermissionFailure>()),
    );
  });
}
