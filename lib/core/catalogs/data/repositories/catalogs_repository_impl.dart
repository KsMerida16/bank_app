import 'package:bank_app/core/catalogs/data/data_sources/firebase_catalogs_data_source.dart';
import 'package:bank_app/core/catalogs/domain/entities/catalog.dart';
import 'package:bank_app/core/catalogs/domain/repositories/catalog_repository.dart';
import 'package:bank_app/core/errors/error_mapper.dart';

class CatalogsRepositoryImpl implements CatalogRepository {
  CatalogsRepositoryImpl({
    required FirebaseCatalogsDataSource firebaseCatalogsDataSource,
  }) : _firebaseCatalogsDataSource = firebaseCatalogsDataSource;

  final FirebaseCatalogsDataSource _firebaseCatalogsDataSource;

  @override
  Future<List<Catalog>> getCatalogsByTable(String tableName) async {
    try {
      final catalogModels = await _firebaseCatalogsDataSource.getCatalogByTable(
        tableName,
      );
      return catalogModels.map(Catalog.fromModel).toList();
    } catch (e) {
      throw mapToFailure(e, context: 'cargar catálogos');
    }
  }
}
