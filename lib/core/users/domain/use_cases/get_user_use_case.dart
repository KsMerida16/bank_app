import 'package:bank_app/core/users/data/repositories/users_repository_impl.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/core/users/domain/repositories/users_repository.dart';

class GetUserUseCase {
  final UsersRepository _usersRepository;

  // ignore: sort_constructors_first
  GetUserUseCase({UsersRepository? usersRepository})
    : _usersRepository = usersRepository ?? UsersRepositoryImpl();

  Future<User> execute(String userId) async {
    try {
      final user = await _usersRepository.getUser(userId);
      return user;
    } catch (e) {
      throw Exception('Error executing GetUserUseCase: $e');
    }
  }
}
