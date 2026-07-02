import 'package:bank_app/features/settings/domain/entities/language_entity.dart';

class LanguageCatalog {
  const LanguageCatalog._();

  static const List<LanguageEntity> languages = [
    LanguageEntity(code: 'en', name: 'English'),
    LanguageEntity(code: 'es', name: 'Español'),
  ];
}
