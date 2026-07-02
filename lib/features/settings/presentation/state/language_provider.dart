import 'package:bank_app/features/settings/data/datasource/language_local_datasource.dart';
import 'package:bank_app/features/settings/data/repository/language_repository_impl.dart';
import 'package:bank_app/features/settings/domain/repository/language_repository.dart';
import 'package:bank_app/features/settings/domain/use_cases/change_language_usecase.dart';
import 'package:bank_app/features/settings/domain/use_cases/get_language_usecase.dart';
import 'package:bank_app/features/settings/presentation/state/language_notifier.dart';
import 'package:bank_app/features/settings/presentation/state/language_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final languageDatasourceProvider = Provider<LanguageLocalDatasource>(
  (ref) => LanguageLocalDatasource(),
);

final languageRepositoryProvider = Provider<LanguageRepository>(
  (ref) => LanguageRepositoryImpl(ref.read(languageDatasourceProvider)),
);

final getLanguageUseCaseProvider = Provider<GetCurrentLanguageUseCase>(
  (ref) => GetCurrentLanguageUseCase(ref.read(languageRepositoryProvider)),
);

final changeLanguageUseCaseProvider = Provider<ChangeLanguageUseCase>(
  (ref) => ChangeLanguageUseCase(ref.read(languageRepositoryProvider)),
);

final languageNotifierProvider =
    NotifierProvider<LanguageNotifier, LanguageState>(LanguageNotifier.new);
