// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MovementModel _$MovementModelFromJson(Map<String, dynamic> json) =>
    _MovementModel(
      date: json['date'] as String,
      timestamp: json['timestamp'] as String,
      description: json['description'] as String,
      amount: (json['amount'] as num).toDouble(),
      type: json['type'] as String,
      sign: json['sign'] as String,
      category: json['category'] as String,
    );

Map<String, dynamic> _$MovementModelToJson(_MovementModel instance) =>
    <String, dynamic>{
      'date': instance.date,
      'timestamp': instance.timestamp,
      'description': instance.description,
      'amount': instance.amount,
      'type': instance.type,
      'sign': instance.sign,
      'category': instance.category,
    };
