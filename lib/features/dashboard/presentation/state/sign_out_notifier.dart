import 'package:bank_app/features/auth/domain/use_cases/sign_out_use_case.dart';
import 'package:bank_app/features/auth/presentation/state/sign_out_state.dart';
import 'package:riverpod/legacy.dart';

final signOutRiverpodProvider =
    StateNotifierProvider<SignOutNotifier, SignOutState>(
      (ref) => SignOutNotifier(),
    );

class SignOutNotifier extends StateNotifier<SignOutState> {
  SignOutNotifier({SignOutUseCase? signOutUseCase})
    : _signOutUseCase = signOutUseCase ?? SignOutUseCase(),
      super(SignOutInitialState());

  final SignOutUseCase _signOutUseCase;

  Future<bool> signOut() async {
    state = SignOutLoadingState();

    try {
      await _signOutUseCase.call();
      state = SignOutSuccessState();
      return true;
    } catch (e) {
      print(e);
      state = SignOutErrorState('Error al cerrar sesión: $e');
      return false;
    }
  }
}
