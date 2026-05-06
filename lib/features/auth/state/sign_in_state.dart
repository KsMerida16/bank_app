abstract base class SignInState {
  SignInState({required this.title, required this.logged});
  final String title;
  final bool logged;
}

final class SignInInitialState extends SignInState {
  SignInInitialState() : super(title: 'Login', logged: false);
}

final class SignInLoadingState extends SignInState {
  SignInLoadingState() : super(title: 'Haciendo login...', logged: false);
}

final class SignInCheckingCacheState extends SignInState {
  SignInCheckingCacheState()
    : super(title: 'Verificando sesión...', logged: false);
}

final class SignInSuccessState extends SignInState {
  SignInSuccessState(this.userName, this.userGender, this.userImage)
    : super(title: 'Bienvenido $userName', logged: true);
  final String userName;
  final String userGender;
  final String userImage;
}

final class SignInErrorState extends SignInState {
  SignInErrorState(this.errorMessage)
    : super(title: 'Error al hacer login', logged: false);
  final String errorMessage;
}
