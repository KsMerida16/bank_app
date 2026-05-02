import 'package:bank_app/features/auth/data/data/models/user_model.dart';

class User {
  factory User.fromModel(UserModel userModel) {
    return User(
      id: userModel.id,
      name: userModel.name,
      email: userModel.email,
      surname: '', //userModel.surname,
    );
  }
  User({
    required this.id,
    required this.name,
    required this.email,
    required this.surname,
  });
  final String id;
  final String email;
  final String name;
  final String surname;
  String _newId = '';

  String get fullName => '$name $surname';
  set newId(String newId) => _newId = '$newId-modified';
}
