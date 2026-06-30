import 'package:bank_app/core/accounts/data/repositories/accounts_repository_impl.dart';
import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';

class GetAccountsUseCase {
  AccountsRepository _accountsRepository;

  // ignore: sort_constructors_first
  GetAccountsUseCase({AccountsRepository? accountsRepository})
    : _accountsRepository = accountsRepository ?? AccountsRepositoryImpl();

  Future<List<Account>> execute(String userId) async {
    try {
      final models = await _accountsRepository.getAccountsByUserId(userId);
      final accounts = models.map((model) => Account.fromModel(model)).toList();
      return accounts;
    } catch (e) {
      throw Exception('Error fetching accounts: $e');
    }
  }
}
