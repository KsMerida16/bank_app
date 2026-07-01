import 'package:bank_app/core/catalogs/data/repositories/catalogs_repository_impl.dart';
import 'package:bank_app/core/catalogs/domain/entities/catalog.dart';
import 'package:bank_app/core/catalogs/domain/repositories/catalog_repository.dart';

class GetCatalogUseCase {
  final CatalogRepository _catalogRepository;

  // ignore: sort_constructors_first
  GetCatalogUseCase({CatalogRepository? catalogRepository})
    : _catalogRepository = catalogRepository ?? CatalogsRepositoryImpl();

  Future<List<Catalog>> execute(String tableName) async {
    try {
      return await _catalogRepository.getCatalogsByTable(tableName);
    } catch (e) {
      throw Exception('Error fetching catalogs: $e');
    }
  }
}
