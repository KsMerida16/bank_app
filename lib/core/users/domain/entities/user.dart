import 'package:bank_app/core/users/data/models/user_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user.freezed.dart';

@freezed
abstract class User with _$User {
  const User._();

  const factory User({
    required String email,
    String? name,
    String? surname,
    String? gender,
    String? image,
  }) = _User;

  String get fullName => '${name ?? ''} ${surname ?? ''}'.trim();

  // ignore: sort_constructors_first
  factory User.fromModel(UserModel userModel) {
    return User(
      email: userModel.email,
      name: userModel.firstName,
      surname: userModel.lastName,
      gender: userModel.gender,
      image: userModel.image,
    );
  }
}
