import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/domain/entities/bank_card.dart';

extension AccountModelMapper on AccountModel {
  Account toEntity() => Account(
    accountUserId: accountUserId,
    accountNumber: accountNumber,
    accountType: accountType,
    accountBalance: accountBalance,
  );
}

extension CardModelMapper on CardModel {
  BankCard toEntity() => BankCard(
    cardUserId: cardUserId,
    cardNumber: cardNumber,
    cardHolderName: cardHolderName,
    expirationDate: expirationDate,
  );
}