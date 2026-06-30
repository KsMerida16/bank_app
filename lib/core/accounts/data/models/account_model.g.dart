// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_AccountModel _$AccountModelFromJson(Map<String, dynamic> json) =>
    _AccountModel(
      accountUserId: json['user_id'] as String,
      accountNumber: json['number'] as String,
      accountType: json['type'] as String,
      accountCurrency: json['currency'] as num,
      accountName: json['name'] as String,
      accountBalance: (json['balance'] as num).toDouble(),
    );

Map<String, dynamic> _$AccountModelToJson(_AccountModel instance) =>
    <String, dynamic>{
      'user_id': instance.accountUserId,
      'number': instance.accountNumber,
      'type': instance.accountType,
      'currency': instance.accountCurrency,
      'name': instance.accountName,
      'balance': instance.accountBalance,
    };
