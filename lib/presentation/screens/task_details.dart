import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/models/task.dart';
import 'package:task_viewer/presentation/cubits/category/category_cubit.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';
import 'package:task_viewer/presentation/widgets/category_widget.dart';
import 'package:task_viewer/presentation/widgets/priority_badge.dart';

class TaskDetails extends StatelessWidget {
  const TaskDetails({super.key, required this.task});

  final Task task;

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
                    BlocProvider(
                      create: (context) =>
                          CategoryCubit()..getCategoryById(task.categoryId),
                      child: const CategoryText(),
                    ),
                    Row(
                      children: [
                        const Text('Priority: '),
                        PriorityBadge(priority: task.priority),
                        const Spacer(),
                        const Text('Status: '),
                        BlocProvider(
                          create: (context) => TasksCubit(),
                          child: BlocBuilder<TasksCubit, TasksState>(
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
                          ),
                        ),
                      ],
                    ),
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
