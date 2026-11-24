import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/domain/repositories/cars_repository.dart';

class GetCardsUseCase {
  GetCardsUseCase({required CardsRepository cardsRepository})
    : _cardsRepository = cardsRepository;

  final CardsRepository _cardsRepository;

  Future<List<CardModel>> execute(String userId) {
    return _cardsRepository.getCardsByUserId(userId);
  }
}
