import 'package:flutter/material.dart';

class TaskDetails extends StatelessWidget {
  static const routeName = '/task_details';

  const TaskDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Task Details'), centerTitle: true));
  }
}
