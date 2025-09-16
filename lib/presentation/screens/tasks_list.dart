import 'package:flutter/material.dart';
import 'package:task_viewer/presentation/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      itemCount: 5,
      itemBuilder: (context, index) {
        return const TaskTile();
      },
      separatorBuilder: (context, index) => Divider(color: Colors.blue),
    );
  }
}
