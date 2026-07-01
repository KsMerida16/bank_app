import 'package:bank_app/core/catalogs/data/models/catalog_model.dart';
import 'package:bank_app/core/constants/app_firebase_tables.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class FirebaseCatalogsDataSource {
  final FirebaseFirestore _firestore;

  // ignore: sort_constructors_first
  FirebaseCatalogsDataSource({FirebaseFirestore? firestore})
    : _firestore = firestore ?? FirebaseFirestore.instance;

  Future<List<CatalogModel>> getCatalogByTable(String table) async {
    try {
      final querySnapshot = await _firestore
          .collection(AppFirebaseCollections.catalogs)
          .where(AppFirebaseKeys.catalogsKey, isEqualTo: table)
          .get();
      return querySnapshot.docs
          .map((doc) => CatalogModel.fromJson(doc.data()))
          .toList();
    } catch (e) {
      throw Exception('Error fetching catalog $table: $e');
    }
  }
}
