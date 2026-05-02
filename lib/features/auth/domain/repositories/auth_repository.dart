import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepository {
  Future<Either<Failure, User>> login(String email, String password);
}
