import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/domain/repository/language_repository.dart';

class ChangeLanguageUseCase {
  final LanguageRepository repository;

  ChangeLanguageUseCase(this.repository);

  Future<void> call(LanguageEntity language) {
    return repository.changeLanguage(language);
  }
}