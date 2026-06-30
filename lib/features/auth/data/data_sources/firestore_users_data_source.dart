import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/app_errors.dart';
import 'package:bank_app/features/auth/data/models/user_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreUsersDataSource {
  FirestoreUsersDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  final FirebaseFirestore _firestore;

  Future<UserModel> getUser(String email) async {
    final collectionRef = _firestore.collection(AppFirebaseTables.users);
    final query = collectionRef.where(
      AppFirebaseKeys.usersEmailKey,
      isEqualTo: email.toString(),
    );
    final result = await query.get();
    final user = result.docs.map((doc) => UserModel.fromJson(doc.data())).first;
    return user;
  }

  Future<String> saveUserRole(UserModel user) async {
    try {
      final collectionRef = _firestore.collection(AppFirebaseTables.users);
      final docRef = await collectionRef.add(user.toJson());
      return docRef.id;
    } catch (e) {
      throw Exception('${AppErrors.usersException}: $e');
    }
  }
}
