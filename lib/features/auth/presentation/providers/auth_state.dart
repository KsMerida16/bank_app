import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/usecases/login_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthState {
  final bool isLoading;
  final User? user;
  final String? error;

  AuthState({this.isLoading = false, this.user, this.error});

  AuthState copyWith({bool? isLoading, User? user, String? error}) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      user: user ?? this.user,
      error: error ?? this.error,
    );
  }
}

class AuthNotifier extends StateNotifier<AuthState> {
  final LoginUseCase loginUseCase;

  AuthNotifier(this.loginUseCase) : super(AuthState());

  Future<void> login(String email, String password) async {
    state = state.copyWith(isLoading: true, error: null);

    final result = await loginUseCase(email, password);

    result.fold(
      (failure) {
        state = state.copyWith(isLoading: false, error: failure.message);
      },
      (user) {
        state = state.copyWith(isLoading: false, user: user);
      },
    );
  }
}
