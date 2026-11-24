import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/domain/repository/language_repository.dart';

class GetCurrentLanguageUseCase {
  GetCurrentLanguageUseCase(this.repository);

  final LanguageRepository repository;

  Future<LanguageEntity> call() {
    return repository.getCurrentLanguage();
  }
}
