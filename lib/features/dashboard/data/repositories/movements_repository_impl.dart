import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/features/dashboard/data/data_sources/firebase_movements_data_source.dart';
import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';

class MovementsRepositoryImpl implements MovementsRepository {
  MovementsRepositoryImpl({
    required FirebaseMovementsDataSource movementsDataSource,
  }) : _movementsDataSource = movementsDataSource;

  final FirebaseMovementsDataSource _movementsDataSource;

  @override
  Future<List<Movement>> getMovements(String userId) async {
    try {
      final models = await _movementsDataSource.getMovements(userId);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar movimientos');
    }
  }

  @override
  Future<List<Movement>> getMovementsByPage(
    String userId,
    int limit,
    String timestamp,
  ) async {
    try {
      final models = await _movementsDataSource.getMovementsByPage(
        userId,
        limit,
        timestamp,
      );
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar movimientos');
    }
  }
}
