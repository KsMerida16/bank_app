import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'language_model.freezed.dart';
part 'language_model.g.dart';

@freezed
abstract class LanguageModel with _$LanguageModel {
  const factory LanguageModel({required String code, required String name}) =
      _LanguageModel;

  factory LanguageModel.fromJson(Map<String, dynamic> json) =>
      _$LanguageModelFromJson(json);
}

extension LanguageModelMapper on LanguageModel {
  LanguageEntity toEntity() {
    return LanguageEntity(code: code, name: name);
  }
}

extension LanguageEntityMapper on LanguageEntity {
  LanguageModel toModel() {
    return LanguageModel(code: code, name: name);
  }
}
