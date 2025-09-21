class ApiError {
  String code;
  String details;
  String hint;
  String message;

  ApiError({
    required this.code,
    required this.details,
    required this.hint,
    required this.message,
  });

  factory ApiError.fromJson(Map<String, dynamic>? json) {
    return ApiError(
      code: json?['code'] ?? '',
      details: json?['details'] ?? '',
      hint: json?['hint'] ?? '',
      message: json?['message'] ?? '',
    );
  }
}
