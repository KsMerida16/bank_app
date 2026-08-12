import 'package:bank_app/core/accounts/domain/entities/account.dart';
import 'package:bank_app/core/accounts/data/models/card_model.dart';
import 'package:bank_app/core/users/domain/entities/user.dart';
import 'package:bank_app/features/dashboard/domain/entities/movement.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'dashboard_state.freezed.dart';

@freezed
abstract class DashboardState with _$DashboardState {
  factory DashboardState.initial() = _Initial;
  factory DashboardState.loading() = _Loading;
  factory DashboardState.loaded({
    required User user,
    required List<Account> accounts,
    required List<CardModel> cards,
    required List<Movement> movements,
    required bool hasMoreMovements,
    required bool isLoadingMoreMovements,
    required String? lastMovementTimestamp,
  }) = _Loaded;
  factory DashboardState.error({required String message}) = _Error;
}
