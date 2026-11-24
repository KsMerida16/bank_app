import 'package:bank_app/core/accounts/domain/entities/account.dart';

abstract class AccountsRepository {
  Future<List<Account>> getAccountsByUserId(String userId);
}