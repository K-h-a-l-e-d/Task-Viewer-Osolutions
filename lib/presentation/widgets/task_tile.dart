import 'package:flutter/material.dart';
import 'package:task_viewer/models/task.dart';
import 'package:task_viewer/presentation/widgets/completion_checkbox.dart';
import 'package:task_viewer/presentation/widgets/priority_badge.dart';

class TaskTile extends StatelessWidget {
  const TaskTile({super.key, required this.category, required this.task, this.onTap});
  final Widget category;
  final TaskModel task;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shadowColor: Colors.blue,
      surfaceTintColor: Colors.blue,
      child: ListTile(
        dense: true,
        isThreeLine: true,
        titleAlignment: ListTileTitleAlignment.center,
        leading: Image.network(task.imageUrl),
        title: Row(
          children: [
            category,
            const Spacer(),
            SizedBox(height: 20, child: PriorityBadge(priority: task.priority)),
          ],
        ),
        subtitle: Row(
          children: [
            Expanded(
              flex: 5,
              child: Text(
                'Task: ${task.title}',
                overflow: TextOverflow.clip,
                style: TextStyle(
                  decoration: task.completed
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
            Flexible(child: CompletionCheckbox(task: task)),
          ],
        ),
        onTap: onTap,
      ),
    );
  }
}
