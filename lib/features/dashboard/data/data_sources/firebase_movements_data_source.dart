import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMovementsDataSource {
  final FirebaseFirestore _firestore;

  // ignore: sort_constructors_first
  FirebaseMovementsDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<MovementModel>> getMovements(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppFirebaseCollections.movements)
          .where(AppFirebaseKeys.movementsKey, isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => MovementModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(
        'Error fetching movements from ${AppFirebaseCollections.movements} for uid=$userId: $e',
      );
    }
  }

  Future<List<MovementModel>> getMovementsByPage(
    String userId,
    int limit,
    String timestamp,
  ) async {
    try {
      final baseQuery = _firestore
          .collection(AppFirebaseCollections.movements)
          .where(AppFirebaseKeys.movementsKey, isEqualTo: userId)
          .orderBy('timestamp')
          .limit(limit);

      final querySnapshot = await (timestamp.isEmpty
          ? baseQuery.get()
          : baseQuery.startAfter([timestamp]).get());

      return querySnapshot.docs
          .map((doc) => MovementModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(
        'Error fetching movements from ${AppFirebaseCollections.movements} for uid=$userId: $e',
      );
    }
  }
}
