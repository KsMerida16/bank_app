import 'package:bank_app/features/dashboard/data/data_sources/firebase_movements_data_source.dart';
import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';

class MovementsRepositoryImpl implements MovementsRepository {
  final FirebaseMovementsDataSource _movementsDataSource;

  // ignore: sort_constructors_first
  MovementsRepositoryImpl({FirebaseMovementsDataSource? movementsDataSource})
    : _movementsDataSource =
          movementsDataSource ?? FirebaseMovementsDataSource();

  @override
  Future<List<Movement>> getMovements(String userId) async {
    try {
      final models = await _movementsDataSource.getMovements(userId);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw Exception('Error fetching movements: $e');
    }
  }
}
