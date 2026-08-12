import 'package:bank_app/features/dashboard/data/repositories/movements_repository_impl.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';

class GetMovsByPageUseCase {
  final MovementsRepository _repository;

  // ignore: sort_constructors_first
  GetMovsByPageUseCase({MovementsRepository? repository})
    : _repository = repository ?? MovementsRepositoryImpl();

  Future<List<Movement>> call(String userId, int limit, String timestamp) {
    return _repository.getMovementsByPage(userId, limit, timestamp);
  }
}
