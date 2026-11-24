import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';

class GetAccountsUseCase {
  GetAccountsUseCase({required AccountsRepository accountsRepository})
    : _accountsRepository = accountsRepository;

  final AccountsRepository _accountsRepository;

  Future<List<Account>> execute(String userId) async {
    final models = await _accountsRepository.getAccountsByUserId(userId);
    return models.map(Account.fromModel).toList();
  }
}
