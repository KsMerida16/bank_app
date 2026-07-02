import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/data/repositories/cards_repository_impl.dart';
import 'package:bank_app/core/accounts/domain/repositories/cars_repository.dart';

class GetCardsUseCase {
  final CardsRepository _cardsRepository;

  // ignore: sort_constructors_first
  GetCardsUseCase({CardsRepository? cardsRepository})
    : _cardsRepository = cardsRepository ?? CardsRepositoryImpl();

  Future<List<CardModel>> execute(String userId) {
    try {
      return _cardsRepository.getCardsByUserId(userId);
    } catch (e) {
      throw Exception('Error fetching cards: $e');
    }
  }
}
