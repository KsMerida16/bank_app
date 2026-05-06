import 'package:bank_app/core/constants/api_consts.dart';
import 'package:bank_app/features/auth/data/models/user_model.dart';
import 'package:bank_app/features/auth/data/models/user_password_model.dart';
import 'package:dio/dio.dart';

class RemoteAutheticationDataSource {
  final dio = Dio();

  Future<UserModel> signIUpWithEmailAndPassword(
    UserPasswordModel userPasswordModel,
  ) async {
    print(
      'userPasswordModel: ${userPasswordModel.email}, ${userPasswordModel.password}',
    );
    print('ApiConsts.login: ${ApiConsts.login}');

    final response = await dio.post(
      ApiConsts.login,
      data: userPasswordModel.toJson(),
    );

    print('Response status: ${response.statusCode}');
    print('Response data: ${response.data}');

    if (response.statusCode == 200 || response.statusCode == 201) {
      return UserModel.fromJson(response.data);
    } else {
      throw Exception(
        'Error al registrar el usuario. Código de estado: ${response.statusCode}',
      );
    }
  }
}
