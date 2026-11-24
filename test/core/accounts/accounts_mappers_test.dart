import 'package:bank_app/core/accounts/data/mappers/accounts_mappers.dart';
import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('AccountModel.toEntity copia los campos de dominio', () {
    final model = AccountModel(
      accountUserId: 'uid-1',
      accountNumber: '0001',
      accountType: 'Ahorro',
      accountCurrency: 'GTQ',
      accountName: 'Cuenta principal',
      accountBalance: 1500,
    );

    final entity = model.toEntity();

    expect(entity.accountUserId, 'uid-1');
    expect(entity.accountNumber, '0001');
    expect(entity.accountType, 'Ahorro');
    expect(entity.accountBalance, 1500);
  });

  test('CardModel.toEntity copia los campos y no expone CVV', () {
    final model = CardModel.fromJson({
      'user_id': 'uid-1',
      'card_number': '**** **** **** 4242',
      'card_name': 'Kylie',
      'card_expiration': '12/29',
      'card_cvv': '***', // dato viejo en Firestore: se ignora
    });

    final entity = model.toEntity();

    expect(entity.cardUserId, 'uid-1');
    expect(entity.cardNumber, '**** **** **** 4242');
    expect(entity.cardHolderName, 'Kylie');
    expect(entity.expirationDate, '12/29');
  });
}
