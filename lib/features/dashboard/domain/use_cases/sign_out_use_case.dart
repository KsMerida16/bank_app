import 'package:bank_app/features/auth/data/data/repositories/authentication_repository_impl.dart';
import 'package:bank_app/features/auth/domain/repositories/authentication_repository.dart';

class SignOutUseCase {
  SignOutUseCase({AuthenticationRepository? authenticationRepository})
    : _authenticationRepository =
          authenticationRepository ?? AuthenticationRepositoryImpl();
  final AuthenticationRepository _authenticationRepository;

  Future<void> call() async {
    return _authenticationRepository.signOut();
  }
}
