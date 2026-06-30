import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const Account._();

  const factory Account({
    required String accountUserId,
    required String accountNumber,
    required String accountType,
    required double accountBalance,
  }) = _Account;

  // ignore: sort_constructors_first
  factory Account.fromModel(AccountModel accountModel) {
    return Account(
      accountUserId: accountModel.accountUserId,
      accountNumber: accountModel.accountNumber,
      accountType: accountModel.accountType,
      accountBalance: accountModel.accountBalance,
    );
  }
}
