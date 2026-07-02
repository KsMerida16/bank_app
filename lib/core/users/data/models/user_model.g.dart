// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserModel _$UserModelFromJson(Map<String, dynamic> json) => _UserModel(
  username: json['user_name'] as String?,
  email: json['email'] as String,
  firstName: json['first_name'] as String?,
  lastName: json['last_name'] as String?,
  gender: json['gender'] as String?,
  image: json['image'] as String?,
  accessToken: json['accessToken'] as String?,
  newId: json['newId'] as String?,
);

Map<String, dynamic> _$UserModelToJson(_UserModel instance) =>
    <String, dynamic>{
      'user_name': instance.username,
      'email': instance.email,
      'first_name': instance.firstName,
      'last_name': instance.lastName,
      'gender': instance.gender,
      'image': instance.image,
      'accessToken': instance.accessToken,
      'newId': instance.newId,
    };
