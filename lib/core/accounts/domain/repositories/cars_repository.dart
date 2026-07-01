import 'package:bank_app/core/accounts/data/models/card_model.dart';

abstract class CardsRepository {
  Future<List<CardModel>> getCardsByUserId(String userId);
}
