import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/material.dart';

part 'language_state.freezed.dart';

@freezed
abstract class LanguageState with _$LanguageState {
  const factory LanguageState({
    @Default(Locale('en')) Locale locale,
    @Default(false) bool isLoading,
    String? error,
  }) = _LanguageState;
}
