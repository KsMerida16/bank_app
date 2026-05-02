abstract base class SignInState {
  SignInState({required this.title, required this.logged});
  final String title;
  final bool logged;
}

final class LoginInitialState extends SignInState {
  LoginInitialState() : super(title: 'Login', logged: false);
}

final class LoginLoadingState extends SignInState {
  LoginLoadingState() : super(title: 'Haciendo login...', logged: false);
}

final class LoginCheckingCacheState extends SignInState {
  LoginCheckingCacheState()
    : super(title: 'Verificando sesión...', logged: false);
}

final class LoginSuccessState extends SignInState {
  LoginSuccessState(this.userName)
    : super(title: 'Bienvenido $userName', logged: true);
  final String userName;
}

final class LoginErrorState extends SignInState {
  LoginErrorState(this.errorMessage)
    : super(title: 'Error al hacer login', logged: false);
  final String errorMessage;
}
