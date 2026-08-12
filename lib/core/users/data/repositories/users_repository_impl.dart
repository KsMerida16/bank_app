import 'package:bank_app/core/users/data/data_sources/firestore_users_data_source.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/core/users/domain/repositories/users_repository.dart';

class UsersRepositoryImpl implements UsersRepository {
  final FirestoreUsersDataSource _firestoreUsersDataSource;

  // ignore: sort_constructors_first
  UsersRepositoryImpl({FirestoreUsersDataSource? firestoreUsersDataSource})
    : _firestoreUsersDataSource =
          firestoreUsersDataSource ?? FirestoreUsersDataSource();
  @override
  Future<User> getUser(String email) async {
    final userModel = await _firestoreUsersDataSource.getUser(email);
    return User.fromModel(userModel);
  }
}
