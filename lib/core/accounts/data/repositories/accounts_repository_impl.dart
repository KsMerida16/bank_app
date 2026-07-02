import 'package:bank_app/core/accounts/data/data_sources/firebase_accounts_data_source.dart';
import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  final FirebaseAccountsDataSource _firebaseAccountsDataSource;

  // ignore: sort_constructors_first
  AccountsRepositoryImpl({
    FirebaseAccountsDataSource? firebaseAccountsDataSource,
  }) : _firebaseAccountsDataSource =
           firebaseAccountsDataSource ?? FirebaseAccountsDataSource();

  @override
  Future<List<AccountModel>> getAccountsByUserId(String userId) async {
    try {
      return await _firebaseAccountsDataSource.getAccountsByUserId(userId);
    } catch (e) {
      throw Exception('Error fetching accounts: $e');
    }
  }
}
