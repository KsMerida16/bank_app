import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class LoginUseCase {
  final AuthRepository repository;

  LoginUseCase(this.repository);

  Future<Either<Failure, User>> call(String email, String password) {
    return repository.login(email, password);
  }
}
