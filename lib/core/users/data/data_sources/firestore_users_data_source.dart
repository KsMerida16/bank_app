import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/errors/failures.dart';
import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUsersDataSource {
  FirestoreUsersDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

  /// Lee el perfil del usuario: el documento de `users` tiene como id el UID.
  Future<UserModel> getUser(String uid) async {
    try {
      final snapshot = await _firestore
          .collection(AppFirebaseCollections.users)
          .doc(uid)
          .get();
      final data = snapshot.data();
      if (!snapshot.exists || data == null) {
        throw const NotFoundFailure('User profile not found.');
      }
      return UserModel.fromJson(data);
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
