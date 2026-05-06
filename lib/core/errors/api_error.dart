class ApiError implements Exception {
  ApiError({required this.message, this.statusCode});
  final String message;
  final int? statusCode;

  @override
  String toString() {
    return "ApiError: $message ( code: $statusCode )";
  }
}
