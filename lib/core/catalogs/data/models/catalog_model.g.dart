// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'catalog_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CatalogModel _$CatalogModelFromJson(Map<String, dynamic> json) =>
    _CatalogModel(
      table: json['table'] as String,
      code: json['code'] as String,
      descriptionEn: json['description_en'] as String,
      descriptionEs: json['description_es'] as String,
    );

Map<String, dynamic> _$CatalogModelToJson(_CatalogModel instance) =>
    <String, dynamic>{
      'table': instance.table,
      'code': instance.code,
      'description_en': instance.descriptionEn,
      'description_es': instance.descriptionEs,
    };
