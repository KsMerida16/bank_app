import 'package:bank_app/core/catalogs/domain/entities/catalog.dart';
import 'package:bank_app/core/catalogs/domain/repositories/catalog_repository.dart';

class GetCatalogUseCase {
  GetCatalogUseCase({required CatalogRepository catalogRepository})
    : _catalogRepository = catalogRepository;

  final CatalogRepository _catalogRepository;

  Future<List<Catalog>> execute(String tableName) {
    return _catalogRepository.getCatalogsByTable(tableName);
  }
}
