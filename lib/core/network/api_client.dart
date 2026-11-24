import 'package:bank_app/core/environment/env.dart';
import 'package:bank_app/core/errors/error_mapper.dart';
import 'package:bank_app/core/network/api_interceptor.dart';
import 'package:dio/dio.dart';

/// Cliente HTTP para backends REST (Node.js / Python).
///
/// Cualquier error de Dio se traduce a un `Failure` tipado; los consumidores
/// nunca ven `DioException`.
class ApiClient {
  ApiClient({Dio? dio})
    : dio =
          dio ??
          Dio(
            BaseOptions(
              baseUrl: Env.apiBaseUrl,
              connectTimeout: const Duration(seconds: 10),
              receiveTimeout: const Duration(seconds: 10),
            ),
          ) {
    this.dio.interceptors.add(ApiInterceptor());
  }

  final Dio dio;

  Future<Response<dynamic>> get(String path) async {
    try {
      return await dio.get<dynamic>(path);
    } catch (e) {
      throw mapToFailure(e, context: 'consultar $path');
    }
  }

  Future<Response<dynamic>> post(String path, dynamic data) async {
    try {
      return await dio.post<dynamic>(path, data: data);
    } catch (e) {
      throw mapToFailure(e, context: 'enviar $path');
    }
  }
}
