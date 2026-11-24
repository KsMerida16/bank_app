import 'package:bank_app/core/accounts/domain/entities/bank_card.dart';

abstract class CardsRepository {
  Future<List<BankCard>> getCardsByUserId(String userId);
}