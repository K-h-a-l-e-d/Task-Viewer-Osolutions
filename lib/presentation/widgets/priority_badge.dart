import 'package:flutter/material.dart';

class PriorityBadge extends StatelessWidget {
  const PriorityBadge({super.key, required this.priority});

  final String? priority;

  @override
  Widget build(BuildContext context) {
    if (priority != null) {
      return Container(
        width: MediaQuery.of(context).size.width / 5,
        decoration: BoxDecoration(
          color: _getPriorityColor(priority!),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Center(
          child: Text(
            priority!,
            style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
      );
    } else {
      return const Text('');
    }
  }
}

Color _getPriorityColor(String priority) {
  switch (priority) {
    case 'high':
      return const Color.fromARGB(255, 230, 12, 8);
    case 'medium':
      return const Color.fromARGB(255, 214, 147, 39);
    case 'low':
      return Colors.grey;
    default:
      return Colors.transparent;
  }
}
