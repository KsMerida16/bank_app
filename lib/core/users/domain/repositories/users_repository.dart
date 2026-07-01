import 'package:bank_app/core/users/domain/entities/user.dart';

abstract class UsersRepository {
  Future<User> getUser(String userId);
}
