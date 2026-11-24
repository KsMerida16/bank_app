import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/core/users/domain/repositories/users_repository.dart';

class GetUserUseCase {
  GetUserUseCase({required UsersRepository usersRepository})
    : _usersRepository = usersRepository;

  final UsersRepository _usersRepository;

  Future<User> execute(String userId) => _usersRepository.getUser(userId);
}
