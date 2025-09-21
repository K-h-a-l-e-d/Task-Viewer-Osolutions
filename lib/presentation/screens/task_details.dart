import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/models/task.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';
import 'package:task_viewer/presentation/widgets/category_widget.dart';
import 'package:task_viewer/presentation/widgets/completion_checkbox.dart';
import 'package:task_viewer/presentation/widgets/priority_badge.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final TaskModel task;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TasksCubit(),
      child: Scaffold(
        appBar: AppBar(title: const Text('Task Details'), centerTitle: true),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.network(task.imageUrl),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  spacing: 10,
                  children: [
                    Text('Task ID: ${task.id}   Category ID: ${task.categoryId}'),
                    Text('Title: ${task.title}'),
                    Text('Description: ${task.description}'),
                    CategoryText(categoryId: task.categoryId),
                    Row(
                      children: [
                        const Text('Priority: '),
                        PriorityBadge(priority: task.priority),
                        const Spacer(),
                        const Text('Status: '),
                        CompletionCheckbox(task: task),
                      ],
                    ),
                    //converting Due Date to ISO 8601 format as mentioned in API docs
                    Text('Due Date: ${task.dueDate.toString().substring(0, 10)}'),
                    Text('Created at: ${task.createdAt.toString().substring(0, 19)}'),
                    Text('Updated at: ${task.updatedAt.toString().substring(0, 19)}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
