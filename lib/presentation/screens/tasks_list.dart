import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/core/utils/helpers.dart';
import 'package:task_viewer/presentation/cubits/category/category_cubit.dart';
import 'package:task_viewer/presentation/cubits/tasks/tasks_cubit.dart';
import 'package:task_viewer/presentation/screens/task_details.dart';
import 'package:task_viewer/presentation/widgets/category_widget.dart';
import 'package:task_viewer/presentation/widgets/task_tile.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksCubit, TasksState>(
      builder: (context, state) {
        return state is TasksLoading
            ? const Center(child: CircularProgressIndicator())
            : state is TasksLoaded
            ? RefreshIndicator(
                onRefresh: context.read<TasksCubit>().getTasks,
                child: ListView.builder(
                  itemCount: state.tasks.length,
                  itemExtent: 90,
                  itemBuilder: (context, index) {
                    final task = state.tasks[index];
                    return BlocProvider(
                      create: (context) =>
                          CategoryCubit()..getCategoryById(task.categoryId),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8),
                        child: TaskTile(
                          taskId: task.id,
                          title: task.title,
                          category: const CategoryText(),
                          priorty: task.priority,
                          imageUrl: task.imageUrl,
                          completed: task.completed,
                          onTap: () => navigateTo(context, TaskDetails(task: task)),
                        ),
                      ),
                    );
                  },
                ),
              )
            : state is TasksError
            ? Center(child: Text(state.error))
            : const Center(child: Text('Unknown State!'));
      },
    );
  }
}
