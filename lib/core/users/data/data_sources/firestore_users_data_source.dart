import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/app_errors.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUsersDataSource {
  FirestoreUsersDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<UserModel> getUser(String email) async {
    final collectionRef = _firestore.collection(AppFirebaseCollections.users);

    try {
      final querySnapshot = await collectionRef
          .where(AppFirebaseKeys.usersEmailKey, isEqualTo: email)
          .get();
      if (querySnapshot.docs.isNotEmpty) {
        return UserModel.fromJson(querySnapshot.docs.first.data());
      }

      throw Exception('User profile not found for email: $email');
    } catch (e) {
      throw Exception('${AppErrors.usersException}: $e');
    }
  }

  Future<String> saveUserRole(UserModel user) async {
    try {
      final collectionRef = _firestore.collection(AppFirebaseCollections.users);
      final docRef = await collectionRef.add(user.toJson());
      return docRef.id;
    } catch (e) {
      throw Exception('${AppErrors.usersException}: $e');
    }
  }
}
