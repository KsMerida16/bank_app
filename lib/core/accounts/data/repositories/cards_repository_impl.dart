import 'package:bank_app/core/accounts/data/data_sources/firebase_cards_data_source.dart';
import 'package:bank_app/core/accounts/data/mappers/accounts_mappers.dart';
import 'package:bank_app/core/accounts/domain/entities/bank_card.dart';
import 'package:bank_app/core/accounts/domain/repositories/cards_repository.dart';
import 'package:bank_app/core/errors/error_mapper.dart';

class CardsRepositoryImpl implements CardsRepository {
  CardsRepositoryImpl({
    required FirebaseCardsDataSource firebaseCardsDataSource,
  }) : _firebaseCardsDataSource = firebaseCardsDataSource;

  final FirebaseCardsDataSource _firebaseCardsDataSource;

  @override
  Future<List<BankCard>> getCardsByUserId(String userId) async {
    try {
      final models = await _firebaseCardsDataSource.getCardsByUserId(userId);
      return models.map((model) => model.toEntity()).toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar tarjetas');
    }
  }
}
