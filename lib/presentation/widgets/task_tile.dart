import 'package:flutter/material.dart';
import 'package:task_viewer/presentation/screens/task_details.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => Navigator.pushNamed(context, TaskDetails.routeName),
    );
  }
}
