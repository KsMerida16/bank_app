import 'package:bank_app/core/accounts/data/models/account_model.dart';

abstract class AccountsRepository {
  Future<List<AccountModel>> getAccountsByUserId(String userId);
}
