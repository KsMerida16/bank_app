import 'package:bank_app/features/auth/data/repositories/authentication_repository_impl.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignedInUseCase {
  SignedInUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();
  final AuthenticationRepository _authenticationRepository;

  Future<bool> call() async {
    return _authenticationRepository.isSignedIn();
  }
}
