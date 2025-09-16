import 'package:flutter/material.dart';
import 'package:task_viewer/presentation/screens/tasks_list.dart';

class TaskViewerApp extends StatelessWidget {
  const TaskViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Task Viewer'), centerTitle: true),
      body: const TasksList(),
    );
  }
}
