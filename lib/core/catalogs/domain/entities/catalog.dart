import 'package:bank_app/core/catalogs/data/models/catalog_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog.freezed.dart';

@freezed
abstract class Catalog with _$Catalog {
  const Catalog._();

  const factory Catalog({
    required String table,
    required String code,
    required String descriptionEn,
    required String descriptionEs,
  }) = _Catalog;

  // ignore: sort_constructors_first
  factory Catalog.fromModel(CatalogModel catalogModel) {
    return Catalog(
      table: catalogModel.table,
      code: catalogModel.code,
      descriptionEn: catalogModel.descriptionEn,
      descriptionEs: catalogModel.descriptionEs,
    );
  }
}
