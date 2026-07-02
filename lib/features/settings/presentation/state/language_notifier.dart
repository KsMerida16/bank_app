import 'dart:ui';
import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/presentation/state/language_provider.dart';
import 'package:bank_app/features/settings/presentation/state/language_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter/material.dart';

class LanguageNotifier extends Notifier<LanguageState> {
  @override
  LanguageState build() {
    _loadLanguage();

    return const LanguageState();
  }

  Future<void> _loadLanguage() async {
    final useCase = ref.read(getLanguageUseCaseProvider);

    final language = await useCase();

    state = state.copyWith(locale: Locale(language.code));
  }

  Future<void> changeLanguage(LanguageEntity language) async {
    final useCase = ref.read(changeLanguageUseCaseProvider);

    await useCase(language);

    state = state.copyWith(locale: Locale(language.code));
  }
}
