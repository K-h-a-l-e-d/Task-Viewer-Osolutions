import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/models/task.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';

class CompletionCheckbox extends StatelessWidget {
  const CompletionCheckbox({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return Checkbox(
          value: task.completed,
          onChanged: (value) {
            context.read<TasksCubit>().updateTaskCompletionStatus(
              completed: task.completed,
              id: task.id,
            );
          },
        );
      },
    );
  }
}
