import 'package:bank_app/features/dashboard/data/repositories/movements_repository_impl.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';

class GetMovementsUseCase {
  final MovementsRepository _movementsRepository;

  // ignore: sort_constructors_first
  GetMovementsUseCase({MovementsRepository? movementsRepository})
    : _movementsRepository = movementsRepository ?? MovementsRepositoryImpl();

  Future<List<Movement>> execute(String userId) async {
    try {
      final movements = await _movementsRepository.getMovements(userId);
      return movements;
    } catch (e) {
      throw Exception('Error executing GetMovementsUseCase: $e');
    }
  }
}
