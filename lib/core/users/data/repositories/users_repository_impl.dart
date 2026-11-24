import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/users/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/core/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  UsersRepositoryImpl({
    required FirestoreUsersDataSource firestoreUsersDataSource,
  }) : _firestoreUsersDataSource = firestoreUsersDataSource;

  final FirestoreUsersDataSource _firestoreUsersDataSource;

  @override
  Future<User> getUser(String userId) async {
    try {
      final userModel = await _firestoreUsersDataSource.getUser(userId);
      return User.fromModel(userModel);
    } catch (e) {
      throw mapToFailure(e, context: 'cargar el usuario');
    }
  }
}
