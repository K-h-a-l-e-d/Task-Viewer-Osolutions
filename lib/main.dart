import 'package:flutter/material.dart';
import 'package:task_viewer/presentation/screens/task_details.dart';
import 'package:task_viewer/task_view_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Viewer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const TaskViewerApp(),
      routes: {TaskDetails.routeName: (context) => TaskDetails()},
    );
  }
}
