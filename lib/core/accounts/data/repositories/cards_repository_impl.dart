import 'package:bank_app/core/accounts/data/data_sources/firebase_cards_data_source.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/accounts/domain/repositories/cars_repository.dart';
import 'package:bank_app/core/errors/error_mapper.dart';

class CardsRepositoryImpl implements CardsRepository {
  CardsRepositoryImpl({
    required FirebaseCardsDataSource firebaseCardsDataSource,
  }) : _firebaseCardsDataSource = firebaseCardsDataSource;

  final FirebaseCardsDataSource _firebaseCardsDataSource;

  @override
  Future<List<CardModel>> getCardsByUserId(String userId) async {
    try {
      return await _firebaseCardsDataSource.getCardsByUserId(userId);
    } catch (e) {
      throw mapToFailure(e, context: 'cargar tarjetas');
    }
  }
}
