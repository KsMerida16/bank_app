import 'package:freezed_annotation/freezed_annotation.dart';

part 'account.freezed.dart';

@freezed
abstract class Account with _$Account {
  const factory Account({
    required String accountUserId,
    required String accountNumber,
    required String accountType,
    required double accountBalance,
  }) = _Account;
}