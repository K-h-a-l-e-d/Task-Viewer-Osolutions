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
}
