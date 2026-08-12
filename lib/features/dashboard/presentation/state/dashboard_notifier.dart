import 'package:bank_app/core/accounts/domain/use_cases/get_accounts_use_case.dart';
import 'package:bank_app/core/accounts/domain/use_cases/get_cards_use_case.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/users/domain/use_cases/get_user_use_case.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movs_by_page_use_case.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:riverpod/legacy.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
      (ref) => DashboardNotifier(),
    );

class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetUserUseCase _getUserUseCase;
  final GetAccountsUseCase _getAccountsUseCase;
  final GetCardsUseCase _getCardsUseCase;
  final GetMovsByPageUseCase _getMovementsUseCase;
  String? _lastUserId;

  // ignore: sort_constructors_first
  DashboardNotifier({
    GetUserUseCase? getUserUseCase,
    GetAccountsUseCase? getAccountsUseCase,
    GetCardsUseCase? getCardsUseCase,
    GetMovsByPageUseCase? getMovementsUseCase,
  }) : _getUserUseCase = getUserUseCase ?? GetUserUseCase(),
       _getAccountsUseCase = getAccountsUseCase ?? GetAccountsUseCase(),
       _getCardsUseCase = getCardsUseCase ?? GetCardsUseCase(),
       _getMovementsUseCase = getMovementsUseCase ?? GetMovsByPageUseCase(),
       super(DashboardState.initial());

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
    } catch (e) {
      state = currentLoadedState.copyWith(isLoadingMoreMovements: false);
      state = DashboardState.error(message: e.toString());
    }
  }

  Future<void> refreshDashboard() async {
    final userId = _lastUserId;
    if (userId == null || userId.isEmpty) return;

    await loadDashboard(userId);
  }
}
