import 'package:bank_app/core/accounts/data/models/account_model.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseAccountsDataSource {
  FirebaseAccountsDataSource({required FirebaseFirestore firestore})
    : _firestore = firestore;

  final FirebaseFirestore _firestore;

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
      throw mapToFailure(e, context: 'cargar cuentas');
    }
  }

  Future<void> addAccount(AccountModel accountData) async {
    try {
      await _firestore
          .collection(AppFirebaseCollections.accounts)
          .add(accountData.toJson());
    } catch (e) {
      throw mapToFailure(e, context: 'agregar cuenta');
    }
  }
}
