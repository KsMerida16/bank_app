import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/features/auth/di/auth_providers.dart';
import 'package:bank_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:bank_app/features/auth/presentation/state/sign_out_state.dart';
import 'package:riverpod/legacy.dart';

final signOutRiverpodProvider =
    StateNotifierProvider<SignOutNotifier, SignOutState>(
      (ref) => SignOutNotifier(
        signOutUseCase: ref.watch(signOutUseCaseProvider),
      ),
    );

class SignOutNotifier extends StateNotifier<SignOutState> {
  SignOutNotifier({required SignOutUseCase signOutUseCase})
    : _signOutUseCase = signOutUseCase,
      super(SignOutInitialState());

  final SignOutUseCase _signOutUseCase;

  Future<bool> signOut() async {
    state = SignOutLoadingState();

    try {
      await _signOutUseCase.call();
      state = SignOutSuccessState();
      return true;
    } catch (e, st) {
      AppLogger.error('Fallo el cierre de sesión', e, st);
      state = SignOutErrorState('Error al cerrar sesión: $e');
      return false;
    }
  }
}
