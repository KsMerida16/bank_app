import 'package:bank_app/core/accounts/data/data_sources/firebase_accounts_data_source.dart';
import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';
import 'package:bank_app/core/errors/error_mapper.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  AccountsRepositoryImpl({
    required FirebaseAccountsDataSource firebaseAccountsDataSource,
  }) : _firebaseAccountsDataSource = firebaseAccountsDataSource;

  final FirebaseAccountsDataSource _firebaseAccountsDataSource;

  @override
  Future<List<AccountModel>> getAccountsByUserId(String userId) async {
    try {
      return await _firebaseAccountsDataSource.getAccountsByUserId(userId);
    } catch (e) {
      throw mapToFailure(e, context: 'cargar cuentas');
    }
  }
}
