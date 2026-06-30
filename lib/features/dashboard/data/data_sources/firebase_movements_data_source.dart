import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/features/dashboard/data/models/movement_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseMovementsDataSource {
  final FirebaseFirestore _firestore;

  // ignore: sort_constructors_first
  FirebaseMovementsDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<MovementModel>> getMovements(String accountNumber) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppFirebaseTables.movements)
          .where(AppFirebaseKeys.movementsKey, isNotEqualTo: accountNumber)
          .get();
      return querySnapshot.docs
          .map((doc) => MovementModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Error fetching movements: $e');
    }
  }
}
