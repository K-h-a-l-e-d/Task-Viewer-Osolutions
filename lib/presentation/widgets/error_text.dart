import 'package:flutter/material.dart';
import 'package:task_viewer/models/api_error.dart';

class ErrorText extends StatelessWidget {
  const ErrorText({super.key, required this.apiError});

  final ApiError apiError;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('code: ${apiError.code}'),
        Text('details: ${apiError.details}'),
        Text('hint: ${apiError.hint}'),
        Text('message: ${apiError.message}'),
      ],
    );
  }
}
