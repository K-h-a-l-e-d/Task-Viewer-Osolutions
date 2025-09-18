import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/core/network/api_client.dart';
import 'package:task_viewer/models/task.dart';

part 'tasks_state.dart';

class TasksCubit extends Cubit<TasksState> {
  TasksCubit() : super(TasksInitial()) {
    getTasks(limit: 10);
  }

  final ApiClient _apiClient = ApiClient();

  Future<void> getTasks({limit = 10, offset, priority, categoryId, completed}) async {
    emit(TasksLoading());
    try {
      final tasks = await _apiClient.getTasks(
        limit: limit,
        offset: offset,
        priority: priority,
        categoryId: categoryId,
        completed: completed,
      );
      emit(TasksLoaded(tasks: tasks!));
    } catch (e) {
      emit(TasksError(error: e.toString()));
    }
  }

  Future<void> updateTaskCompletionStatus({
    required int id,
    required bool completed,
  }) async {
    try {
      await _apiClient.updateTaskCompletionStatus(id, completed);
      await getTasks();
    } catch (e) {
      emit(TasksError(error: e.toString()));
    }
  }
}
