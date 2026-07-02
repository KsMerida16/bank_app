import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCardsDataSource {
  final FirebaseFirestore _firestore;

  // ignore: sort_constructors_first
  FirebaseCardsDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

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
      throw Exception('Error fetching cards: $e');
    }
  }

  Future<void> addCard(CardModel cardData) async {
    try {
      await _firestore
          .collection(AppFirebaseCollections.cards)
          .add(cardData.toJson());
    } catch (e) {
      throw Exception('Error adding card: $e');
    }
  }
}
