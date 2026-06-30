import 'package:bank_app/core/accounts/domain/use_cases/get_accounts_use_case.dart';
import 'package:bank_app/core/users/domain/use_cases/get_user_use_case.dart';
import 'package:bank_app/features/dashboard/domain/use_cases/get_movements_use_case.dart';
import 'package:bank_app/features/dashboard/presentation/state/dashboard_state.dart';
import 'package:riverpod/legacy.dart';

final dashboardNotifierProvider =
    StateNotifierProvider<DashboardNotifier, DashboardState>(
      (ref) => DashboardNotifier(),
    );

class DashboardNotifier extends StateNotifier<DashboardState> {
  final GetUserUseCase _getUserUseCase;
  final GetAccountsUseCase _getAccountsUseCase;
  final GetMovementsUseCase _getMovementsUseCase;

  // ignore: sort_constructors_first
  DashboardNotifier({
    GetUserUseCase? getUserUseCase,
    GetAccountsUseCase? getAccountsUseCase,
    GetMovementsUseCase? getMovementsUseCase,
  }) : _getUserUseCase = getUserUseCase ?? GetUserUseCase(),
       _getAccountsUseCase = getAccountsUseCase ?? GetAccountsUseCase(),
       _getMovementsUseCase = getMovementsUseCase ?? GetMovementsUseCase(),
       super(DashboardState.initial());

  Future<void> loadDashboard(String userId) async {
    state = DashboardState.loading();
    try {
      final user = await _getUserUseCase.execute(userId);
      final accounts = await _getAccountsUseCase.execute(userId);
      final movements = await _getMovementsUseCase.execute(userId);
      state = DashboardState.loaded(
        user: user,
        accounts: accounts,
        movements: movements,
      );
    } catch (e) {
      state = DashboardState.error(message: e.toString());
    }
  }
}
