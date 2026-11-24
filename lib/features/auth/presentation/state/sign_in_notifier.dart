import 'package:bank_app/core/logging/app_logger.dart';
import 'package:bank_app/features/auth/di/auth_providers.dart';
import 'package:bank_app/features/auth/domain/use_cases/signed_in_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/sing_in_use_case.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_state.dart';
import 'package:riverpod/legacy.dart';

final signInRiverpodProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
      (ref) => SignInNotifier(
        signInUseCase: ref.watch(signInUseCaseProvider),
        signedInUseCase: ref.watch(signedInUseCaseProvider),
      ),
    );

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    required SignInUseCase signInUseCase,
    required SignedInUseCase signedInUseCase,
  }) : _signInUseCase = signInUseCase,
       _isSignedInUseCase = signedInUseCase,
       super(SignInInitialState());

  final SignInUseCase _signInUseCase;
  final SignedInUseCase _isSignedInUseCase;

  Future<void> checkIfLogged() async {
    state = SignInCheckingCacheState();

    final isLogged = await _isSignedInUseCase.call();

    if (isLogged) {
      state = SignInSuccessState('Usuario', 'male', '');
    } else {
      state = SignInInitialState();
    }
  }

  Future<bool> login(String email, String password) async {
    state = SignInLoadingState();

    try {
      final user = await _signInUseCase.call(email, password);
      state = SignInSuccessState(
        user.fullName,
        user.gender ?? '',
        user.image ?? '',
      );

      return true;
    } catch (e, st) {
      AppLogger.error('Fallo el inicio de sesión', e, st);

      state = SignInErrorState('Error al iniciar sesión: $e');
      return false;
    }
  }

  void signOut() {
    state = SignInInitialState();
  }

  void loginWithFacebook() {}
}
