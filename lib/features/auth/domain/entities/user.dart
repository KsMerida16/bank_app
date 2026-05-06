
import 'package:bank_app/features/auth/data/data/models/user_model.dart';

class User {
  final String id;
  final String email;
  final String name;
  final String surname;
  final String gender;
  final String image;
  String _newId = '';

  String get fullName => '$name $surname';

  set newId(String newId) {
    _newId = '$newId-modified';
  }

  String get newId => _newId;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.surname,
    required this.gender,
    required this.image,
  });

  factory User.fromModel(UserModel userModel) {
    return User(
      email: userModel.email,
      id: '${userModel.id}',
      name: userModel.firstName,
      surname: userModel.lastName,
      gender: userModel.gender,
      image: userModel.image,
    );
  }
}