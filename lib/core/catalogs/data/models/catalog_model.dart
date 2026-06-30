import 'package:freezed_annotation/freezed_annotation.dart';

part 'catalog_model.freezed.dart';
part 'catalog_model.g.dart';

@freezed
abstract class CatalogModel with _$CatalogModel {
  factory CatalogModel({
    @JsonKey(name: 'table') required String table,
    @JsonKey(name: 'code') required String code,
    @JsonKey(name: 'description_en') required String descriptionEn,
    @JsonKey(name: 'description_es') required String descriptionEs,
  }) = _CatalogModel;

  factory CatalogModel.fromJson(Map<String, dynamic> json) =>
      _$CatalogModelFromJson(json);
}
