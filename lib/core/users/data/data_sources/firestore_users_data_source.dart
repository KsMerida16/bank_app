import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUsersDataSource {
  FirestoreUsersDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

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

      throw const NotFoundFailure('User profile not found.');
    } catch (e) {
      throw mapToFailure(e, context: 'cargar el perfil del usuario');
    }
  }

  Future<String> saveUserRole(UserModel user) async {
    try {
      final collectionRef = _firestore.collection(AppFirebaseCollections.users);
      final docRef = await collectionRef.add(user.toJson());
      return docRef.id;
    } catch (e) {
      throw mapToFailure(e, context: 'guardar el perfil del usuario');
    }
  }
}
