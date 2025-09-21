part of 'tasks_cubit.dart';

@immutable
abstract class TasksState {}

class TasksInitial extends TasksState {}

class TasksLoading extends TasksState {}

class TasksLoaded extends TasksState {
  final List<TaskModel> tasks;

  TasksLoaded({required this.tasks});
}

class TasksError extends TasksState {
  final ApiError apiError;

  TasksError({required this.apiError});
}
