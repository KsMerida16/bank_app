import 'package:bank_app/core/accounts/domain/use_cases/get_accounts_use_case.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_cards_use_case.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/di/core_providers.dart';
import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/core/users/domain/use_cases/get_user_use_case.dart';
import 'package:bank_app/features/dashboard/di/dashboard_providers.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movs_by_page_use_case.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:riverpod/legacy.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
      (ref) => DashboardNotifier(
        getUserUseCase: ref.watch(getUserUseCaseProvider),
        getAccountsUseCase: ref.watch(getAccountsUseCaseProvider),
        getCardsUseCase: ref.watch(getCardsUseCaseProvider),
        getMovementsUseCase: ref.watch(getMovsByPageUseCaseProvider),
      ),
    );

class DashboardNotifier extends StateNotifier<DashboardState> {
  DashboardNotifier({
    required GetUserUseCase getUserUseCase,
    required GetAccountsUseCase getAccountsUseCase,
    required GetCardsUseCase getCardsUseCase,
    required GetMovsByPageUseCase getMovementsUseCase,
  }) : _getUserUseCase = getUserUseCase,
       _getAccountsUseCase = getAccountsUseCase,
       _getCardsUseCase = getCardsUseCase,
       _getMovementsUseCase = getMovementsUseCase,
       super(DashboardState.initial());

  final GetUserUseCase _getUserUseCase;
  final GetAccountsUseCase _getAccountsUseCase;
  final GetCardsUseCase _getCardsUseCase;
  final GetMovsByPageUseCase _getMovementsUseCase;
  String? _lastUserId;

  Future<void> loadDashboard(String userId) async {
    _lastUserId = userId;
    state = DashboardState.loading();
    try {
      final user = await _getUserUseCase.execute(userId);
      final accounts = await _getAccountsUseCase.execute(userId);
      final cards = await _getCardsUseCase.execute(userId);
      final movements = await _getMovementsUseCase.call(
        userId,
        AppFirebasePaginationConstants.defaultLimit,
        '',
      );
      final lastTimestamp = movements.isNotEmpty
          ? movements.last.timestamp
          : null;
      final hasMore =
          movements.length == AppFirebasePaginationConstants.defaultLimit;

      state = DashboardState.loaded(
        user: user,
        accounts: accounts,
        cards: cards,
        movements: movements,
        hasMoreMovements: hasMore,
        isLoadingMoreMovements: false,
        lastMovementTimestamp: lastTimestamp,
      );
    } catch (e) {
      state = DashboardState.error(message: e.toString());
    }
  }

  Future<void> loadMoreMovements() async {
    final currentState = state.maybeWhen(
      loaded:
          (
            user,
            accounts,
            cards,
            movements,
            hasMoreMovements,
            isLoadingMoreMovements,
            lastMovementTimestamp,
          ) => state,
      orElse: () => null,
    );

    if (currentState == null) return;

    final currentLoadedState = currentState as dynamic;
    final userId = _lastUserId;
    if (userId == null || userId.isEmpty) return;
    if (currentLoadedState.isLoadingMoreMovements ||
        !currentLoadedState.hasMoreMovements) {
      return;
    }

    state = currentLoadedState.copyWith(isLoadingMoreMovements: true);

    try {
      final newMovements = await _getMovementsUseCase.call(
        userId,
        AppFirebasePaginationConstants.defaultLimit,
        currentLoadedState.lastMovementTimestamp ?? '',
      );

      final existingTimestamps =
          (currentLoadedState.movements as List<Movement>)
              .map((movement) => movement.timestamp)
              .toSet();

      final mergedMovements =
          List<Movement>.from(currentLoadedState.movements as List<Movement>)
            ..addAll(
              newMovements.where(
                (movement) => !existingTimestamps.contains(movement.timestamp),
              ),
            );

      final hasMore =
          newMovements.length == AppFirebasePaginationConstants.defaultLimit;
      final lastTimestamp = mergedMovements.isNotEmpty
          ? mergedMovements.last.timestamp
          : currentLoadedState.lastMovementTimestamp;

      state = currentLoadedState.copyWith(
        movements: mergedMovements,
        hasMoreMovements: hasMore,
        isLoadingMoreMovements: false,
        lastMovementTimestamp: lastTimestamp,
      );
    } catch (e, st) {
      // Un error al paginar no debe tumbar el dashboard ya cargado:
      // se conserva lo mostrado y se permite reintentar con "cargar más".
      AppLogger.error('Fallo la paginación de movimientos', e, st);
      state = currentLoadedState.copyWith(isLoadingMoreMovements: false);
    }
  }

  Future<void> refreshDashboard() async {
    final userId = _lastUserId;
    if (userId == null || userId.isEmpty) return;

    await loadDashboard(userId);
  }
}
