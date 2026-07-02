import 'package:bank_app/core/catalogs/data/data_sources/firebase_catalogs_data_source.dart';
import 'package:bank_app/core/catalogs/domain/entities/catalog.dart';
import 'package:bank_app/core/catalogs/domain/repositories/catalog_repository.dart';

class CatalogsRepositoryImpl implements CatalogRepository {
  final FirebaseCatalogsDataSource _firebaseCatalogsDataSource;

  // ignore: sort_constructors_first
  CatalogsRepositoryImpl({
    FirebaseCatalogsDataSource? firebaseCatalogsDataSource,
  }) : _firebaseCatalogsDataSource =
           firebaseCatalogsDataSource ?? FirebaseCatalogsDataSource();

  @override
  Future<List<Catalog>> getCatalogsByTable(String tableName) async {
    try {
      final catalogModels = await _firebaseCatalogsDataSource.getCatalogByTable(
        tableName,
      );
      return catalogModels.map((model) => Catalog.fromModel(model)).toList();
    } catch (e) {
      throw Exception('Error fetching catalogs: $e');
    }
  }
}
