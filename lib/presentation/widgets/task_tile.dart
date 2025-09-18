import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';
import 'package:task_viewer/presentation/widgets/priority_badge.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({
    super.key,
    required this.taskId,
    required this.title,
    required this.category,
    required this.priorty,
    required this.imageUrl,
    required this.completed,
    this.onTap,
  });

  final int taskId;
  final String title;
  final Widget category;
  final String priorty;
  final String imageUrl;
  final bool completed;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blue,
      surfaceTintColor: Colors.blue,
      // color: const Color.fromARGB(255, 8, 24, 37),
      child: ListTile(
        dense: true,
        isThreeLine: true,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Image.network(imageUrl),
        title: Row(
          children: [
            category,
            const Spacer(),
            SizedBox(height: 20, child: PriorityBadge(priority: priorty)),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                'Task: $title',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  decoration: completed
                      ? TextDecoration.lineThrough
                      : TextDecoration.none,
                  fontWeight: FontWeight.bold,
                  decorationColor: Colors.redAccent,
                  decorationThickness: 4,
                  color: ColorScheme.of(context).inverseSurface,
                  fontSize: 11,
                ),
              ),
            ),
            Flexible(
              child: Checkbox(
                value: completed,
                onChanged: (value) {
                  context.read<TasksCubit>().updateTaskCompletionStatus(
                    completed: completed,
                    id: taskId,
                  );
                },
              ),
            ),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
