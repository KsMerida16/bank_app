abstract base class SignOutState {
  SignOutState({required this.message, required this.isSignedOut});
  final String message;
  final bool isSignedOut;
}

final class SignOutInitialState extends SignOutState {
  SignOutInitialState()
    : super(message: 'Ready to sign out', isSignedOut: false);
}

final class SignOutLoadingState extends SignOutState {
  SignOutLoadingState()
    : super(message: 'Cerrando sesión...', isSignedOut: false);
}

final class SignOutSuccessState extends SignOutState {
  SignOutSuccessState()
    : super(message: 'Sesión cerrada correctamente', isSignedOut: true);
}

final class SignOutErrorState extends SignOutState {
  SignOutErrorState(this.errorMessage)
    : super(message: 'Error al cerrar sesión', isSignedOut: false);
  final String errorMessage;
}
