import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:task_viewer/task_viewer_app.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Task Viewer',
      debugShowCheckedModeBanner: false,
      scrollBehavior: const MaterialScrollBehavior().copyWith(
        dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
      ),
      theme: ThemeData.dark(),
      home: const TaskViewerApp(),
    );
  }
}
