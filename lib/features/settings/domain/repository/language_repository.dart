import 'package:bank_app/features/settings/domain/entities/language_entity.dart';

abstract class LanguageRepository {
  Future<void> changeLanguage(LanguageEntity language);

  Future<LanguageEntity> getCurrentLanguage();
}
