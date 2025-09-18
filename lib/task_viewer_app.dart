import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';
import 'package:task_viewer/presentation/screens/tasks_list.dart';

class TaskViewerApp extends StatelessWidget {
  const TaskViewerApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //backgroundColor: const Color.fromARGB(255, 2, 27, 39),
      appBar: AppBar(
        title: const Text('Task Viewer'),
        centerTitle: true,
        backgroundColor: Colors.blue.withValues(alpha: 0.3),
      ),
      body: BlocProvider(create: (context) => TasksCubit(), child: const TasksList()),
    );
  }
}
