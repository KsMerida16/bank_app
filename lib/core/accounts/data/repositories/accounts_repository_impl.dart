import 'package:bank_app/core/accounts/data/data_sources/firebase_accounts_data_source.dart';
import 'package:bank_app/core/accounts/data/mappers/accounts_mappers.dart';
import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/domain/repositories/accounts_repository.dart';
import 'package:bank_app/core/errors/error_mapper.dart';

class AccountsRepositoryImpl implements AccountsRepository {
  AccountsRepositoryImpl({
    required FirebaseAccountsDataSource firebaseAccountsDataSource,
  }) : _firebaseAccountsDataSource = firebaseAccountsDataSource;

  final FirebaseAccountsDataSource _firebaseAccountsDataSource;

  @override
  Future<List<Account>> getAccountsByUserId(String userId) async {
    try {
      final models = await _firebaseAccountsDataSource.getAccountsByUserId(
        userId,
      );
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar cuentas');
    }
  }
}
