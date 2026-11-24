import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCardsDataSource {
  FirebaseCardsDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  Future<List<CardModel>> getCardsByUserId(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppFirebaseCollections.cards)
          .where(AppFirebaseKeys.cardsKey, isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => CardModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar tarjetas');
    }
  }

  Future<void> addCard(CardModel cardData) async {
    try {
      await _firestore
          .collection(AppFirebaseCollections.cards)
          .add(cardData.toJson());
    } catch (e) {
      throw mapToFailure(e, context: 'agregar tarjeta');
    }
  }
}
