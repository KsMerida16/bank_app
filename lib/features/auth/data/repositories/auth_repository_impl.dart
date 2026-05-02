import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/features/auth/data/datasources/auth_remote_datasource.dart';
import 'package:bank_app/features/auth/domain/entities/user.dart';
import 'package:bank_app/features/auth/domain/repositories/auth_repository.dart';
import 'package:dartz/dartz.dart';

class AuthRepositoryImpl implements AuthRepository {
  final AuthRemoteDataSource remoteDataSource;

  AuthRepositoryImpl(this.remoteDataSource);

  @override
  Future<Either<Failure, User>> login(String email, String password) async {
    try {
      final userModel = await remoteDataSource.login(email, password);
      return Right(userModel);
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }
}
