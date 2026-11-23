import 'package:bank_app/core/logging/app_logger.dart';
import 'package:dio/dio.dart';

/// Interceptor de trazas. Solo registra método, ruta y código de estado:
/// nunca cuerpos de request/response ni headers (pueden contener tokens o PII).
class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    AppLogger.debug('REQUEST[${options.method}] => PATH: ${options.path}');
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    AppLogger.debug('RESPONSE[${response.statusCode}]');
    handler.next(response);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    AppLogger.warning('ERROR[${err.response?.statusCode}] => ${err.type.name}');
    handler.next(err);
  }
}
