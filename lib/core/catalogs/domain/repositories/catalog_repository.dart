import 'package:bank_app/core/catalogs/domain/entities/catalog.dart';

abstract class CatalogRepository {
  Future<List<Catalog>> getCatalogsByTable(String table);
}
