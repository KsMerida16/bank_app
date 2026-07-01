import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_model.freezed.dart';
part 'account_model.g.dart';

@freezed
abstract class AccountModel with _$AccountModel {
  factory AccountModel({
    @JsonKey(name: 'user_id') required String accountUserId,
    @JsonKey(name: 'number') required String accountNumber,
    @JsonKey(name: 'type') required String accountType,
    @JsonKey(name: 'currency') required String accountCurrency,
    @JsonKey(name: 'name') required String accountName,
    @JsonKey(name: 'balance') required double accountBalance,
  }) = _AccountModel;

  factory AccountModel.fromJson(Map<String, dynamic> json) =>
      _$AccountModelFromJson(json);
}
