import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAccountsDataSource {
  final FirebaseFirestore _firestore;

  // ignore: sort_constructors_first
  FirebaseAccountsDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<AccountModel>> getAccountsByUserId(String userId) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppFirebaseCollections.accounts)
          .where(AppFirebaseKeys.accountsKey, isEqualTo: userId)
          .get();
      return querySnapshot.docs
          .map((doc) => AccountModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception(
        'Error fetching accounts from ${AppFirebaseCollections.accounts} for uid=$userId: $e',
      );
    }
  }

  Future<void> addAccount(AccountModel accountData) async {
    try {
      await _firestore
          .collection(AppFirebaseCollections.accounts)
          .add(accountData.toJson());
    } catch (e) {
      throw Exception('Error adding account: $e');
    }
  }
}
