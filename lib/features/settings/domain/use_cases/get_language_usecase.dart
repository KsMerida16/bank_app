import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/domain/repository/language_repository.dart';

class GetCurrentLanguageUseCase {
  final LanguageRepository repository;

  GetCurrentLanguageUseCase(this.repository);

  Future<LanguageEntity> call() {
    return repository.getCurrentLanguage();
  }
}