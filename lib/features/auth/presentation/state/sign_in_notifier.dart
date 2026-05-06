import 'package:bank_app/features/auth/domain/use_cases/signed_in_use_case.dart';
import 'package:bank_app/features/auth/domain/use_cases/sing_in_use_case.dart';
import 'package:bank_app/features/auth/presentation/state/sign_in_state.dart';
import 'package:riverpod/legacy.dart';

final signInRiverpodProvider =
    StateNotifierProvider<SignInNotifier, SignInState>(
      (ref) => SignInNotifier(),
    );

class SignInNotifier extends StateNotifier<SignInState> {
  SignInNotifier({
    SignInUseCase? signInUseCase,
    SignedInUseCase? signedInUseCase,
  }) : _signInUseCase = signInUseCase ?? SignInUseCase(),
       _isSignedInUseCase = signedInUseCase ?? SignedInUseCase(),
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
      state = SignInSuccessState(user.fullName, user.gender, user.image);

      return true;
    } catch (e) {
      print(e);

      state = SignInErrorState('Error al iniciar sesión: $e');
      return false;
    }
  }

  void signOut() {
    state = SignInInitialState();
  }

  void loginWithFacebook() {}
}
