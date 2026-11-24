import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignedInUseCase {
  SignedInUseCase({required AuthenticationRepository authenticationRepository})
    : _authenticationRepository = authenticationRepository;

  final AuthenticationRepository _authenticationRepository;

  Future<bool> call() => _authenticationRepository.isSignedIn();
}
