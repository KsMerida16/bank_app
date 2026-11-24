import 'package:bank_app/core/accounts/domain/entities/bank_card.dart';
import 'package:bank_app/core/accounts/domain/repositories/cards_repository.dart';

class GetCardsUseCase {
  GetCardsUseCase({required CardsRepository cardsRepository})
    : _cardsRepository = cardsRepository;

  final CardsRepository _cardsRepository;

  Future<List<BankCard>> execute(String userId) {
    return _cardsRepository.getCardsByUserId(userId);
  }
}