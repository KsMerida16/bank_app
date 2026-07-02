// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CardModel _$CardModelFromJson(Map<String, dynamic> json) => _CardModel(
  cardUserId: json['user_id'] as String,
  cardNumber: json['card_number'] as String,
  cardHolderName: json['card_name'] as String,
  expirationDate: json['card_expiration'] as String,
  cvv: json['card_cvv'] as String,
);

Map<String, dynamic> _$CardModelToJson(_CardModel instance) =>
    <String, dynamic>{
      'user_id': instance.cardUserId,
      'card_number': instance.cardNumber,
      'card_name': instance.cardHolderName,
      'card_expiration': instance.expirationDate,
      'card_cvv': instance.cvv,
    };
