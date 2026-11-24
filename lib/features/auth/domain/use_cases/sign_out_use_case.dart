import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignOutUseCase {
  SignOutUseCase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<void> call() => _authenticationRepository.signOut();
}
