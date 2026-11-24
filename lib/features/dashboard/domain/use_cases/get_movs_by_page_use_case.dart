import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';

class GetMovsByPageUseCase {
  GetMovsByPageUseCase({required MovementsRepository repository})
    : _repository = repository;

  final MovementsRepository _repository;

  Future<List<Movement>> call(String userId, int limit, String timestamp) {
    return _repository.getMovementsByPage(userId, limit, timestamp);
  }
}
