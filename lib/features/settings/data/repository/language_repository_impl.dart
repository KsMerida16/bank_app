import 'package:bank_app/features/settings/data/models/language_model.dart';
import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/domain/repository/language_repository.dart';

import '../datasource/language_local_datasource.dart';

class LanguageRepositoryImpl implements LanguageRepository {
  final LanguageLocalDatasource datasource;

  LanguageRepositoryImpl(this.datasource);

  @override
  Future<void> changeLanguage(LanguageEntity language) async {
    await datasource.saveLanguage(language.toModel());
  }

  @override
  Future<LanguageEntity> getCurrentLanguage() async {
    final language = await datasource.getLanguage();

    return language.toEntity();
  }
}
