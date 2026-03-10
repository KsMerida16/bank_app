import 'package:bank_app/core/errors/api_error.dart';
import 'package:bank_app/core/network/api_interceptor.dart';
import 'package:dio/dio.dart';

class ApiClient {
  ApiClient() {
    dio = Dio(
      BaseOptions(
        baseUrl: "https://localhost:3000",
        connectTimeout: const Duration(seconds: 10),
        receiveTimeout: const Duration(seconds: 10),
      ),
    );
    dio.interceptors.add(ApiInterceptor());
  }

  late Dio dio;

  Future<Response> get(String path) async {
    try {
      final response = await dio.get(path);
      return response;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? "Unknown error",
        statusCode: e.response?.statusCode,
      );
    }
  }

  Future<Response> post(String path, dynamic data) async {
    try {
      final response = await dio.post(path, data: data);
      return response;
    } on DioException catch (e) {
      throw ApiError(
        message: e.message ?? "Unknown error",
        statusCode: e.response?.statusCode,
      );
    }
  }
}
