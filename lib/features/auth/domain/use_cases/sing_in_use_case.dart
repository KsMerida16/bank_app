import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignInUseCase {
  SignInUseCase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<User> call(String email, String password) {
    return _authenticationRepository.signInWithEmailAndPassword(
      email,
      password,
    );
  }
}
