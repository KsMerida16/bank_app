import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movs_by_page_use_case.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockMovementsRepository extends Mock implements MovementsRepository {}

Movement _movement(String timestamp) => Movement(
  date: '2026-01-01',
  timestamp: timestamp,
  description: 'Compra',
  amount: 10,
  type: 'POS',
  sign: 'D',
  category: 'Comercio',
);

void main() {
  test('delega la paginación al repositorio con los mismos parámetros', () async {
    final repository = MockMovementsRepository();
    final page = [_movement('1'), _movement('2')];
    when(
      () => repository.getMovementsByPage('uid-1', 2, ''),
    ).thenAnswer((_) async => page);

    final result = await GetMovsByPageUseCase(
      repository: repository,
    ).call('uid-1', 2, '');

    expect(result, page);
    verify(() => repository.getMovementsByPage('uid-1', 2, '')).called(1);
    verifyNoMoreInteractions(repository);
  });

  test('propaga el error del repositorio', () {
    final repository = MockMovementsRepository();
    when(
      () => repository.getMovementsByPage(any(), any(), any()),
    ).thenThrow(Exception('firestore down'));

    expect(
      () => GetMovsByPageUseCase(repository: repository).call('u', 2, ''),
      throwsException,
    );
  });
}
