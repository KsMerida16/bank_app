import 'package:bank_app/features/auth/domain/use_cases/signed_in_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/sing_in_use_case.dart';
import 'package:bank_app/features/auth/state/sign_in_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final loginRiverpodProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
      (ref) => SignInNotifier(),
    );

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    SignInUseCase? loginUseCase,
    SignedInUseCase? isLoggeedUseCase,
  }) : _loginUseCase = loginUseCase ?? SignInUseCase(),
       _isLoggeedUseCase = isLoggeedUseCase ?? SignedInUseCase(),
       super(LoginInitialState());
  final SignInUseCase _loginUseCase;
  final SignedInUseCase _isLoggeedUseCase;

  Future<void> checkIfLogged() async {
    state = LoginCheckingCacheState();

    final isLogged = await _isLoggeedUseCase.call();

    if (isLogged) {
      state = LoginSuccessState('Usuario');
    } else {
      state = LoginInitialState();
    }
  }

  Future<bool> login(String email, String password) async {
    state = LoginLoadingState();

    try {
      final user = await _loginUseCase.call(email, password);
      state = LoginSuccessState(user.name);

      return true;
    } catch (e) {
      state = LoginErrorState('Error al hacer login');
      return false;
    }
  }

  void loginWithFacebook() {}
}
