import 'package:bank_app/core/accounts/data/data_sources/firebase_cards_data_source.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/domain/repositories/cars_repository.dart';

class CardsRepositoryImpl implements CardsRepository {
  final FirebaseCardsDataSource _firebaseCardsDataSource;

  // ignore: sort_constructors_first
  CardsRepositoryImpl({FirebaseCardsDataSource? firebaseCardsDataSource})
    : _firebaseCardsDataSource =
          firebaseCardsDataSource ?? FirebaseCardsDataSource();

  @override
  Future<List<CardModel>> getCardsByUserId(String userId) async {
    try {
      return await _firebaseCardsDataSource.getCardsByUserId(userId);
    } catch (e) {
      throw Exception('Error fetching cards: $e');
    }
  }
}
