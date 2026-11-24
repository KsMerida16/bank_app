import 'package:freezed_annotation/freezed_annotation.dart';

part 'bank_card.freezed.dart';

@freezed
abstract class BankCard with _$BankCard {
  const factory BankCard({
    required String cardUserId,
    required String cardNumber,
    required String cardHolderName,
    required String expirationDate,
  }) = _BankCard;
}