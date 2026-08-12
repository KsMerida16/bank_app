import 'package:bank_app/features/dashboard/domain/entities/movement.dart';

abstract class MovementsRepository {
  Future<List<Movement>> getMovements(String userId);
  Future<List<Movement>> getMovementsByPage(
    String userId,
    int limit,
    String timestamp,
  );
}
