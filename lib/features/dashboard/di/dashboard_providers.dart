import 'package:bank_app/core/di/core_providers.dart';
import 'package:bank_app/features/dashboard/data/data_sources/firebase_movements_data_source.dart';
import 'package:bank_app/features/dashboard/data/repositories/movements_repository_impl.dart';
import 'package:bank_app/features/dashboard/domain/repositories/movements_repository.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movs_by_page_use_case.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final movementsRepositoryProvider = Provider<MovementsRepository>(
  (ref) => MovementsRepositoryImpl(
    movementsDataSource: FirebaseMovementsDataSource(
      firestore: ref.watch(firestoreProvider),
    ),
  ),
);

final getMovsByPageUseCaseProvider = Provider<GetMovsByPageUseCase>(
  (ref) => GetMovsByPageUseCase(
    repository: ref.watch(movementsRepositoryProvider),
  ),
);
