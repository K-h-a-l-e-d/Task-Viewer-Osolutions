class ApiException implements Exception {
  final int code;
  final String message;
  final String details;
  final String hint;

  ApiException({
    required this.code,
    required this.message,
    required this.details,
    required this.hint,
  });
}
