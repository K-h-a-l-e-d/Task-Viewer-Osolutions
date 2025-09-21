part of 'category_cubit.dart';

@immutable
abstract class CategoryState {}

class CategoryInitial extends CategoryState {}

class CategoryLoading extends CategoryState {}

class CategoryLoaded extends CategoryState {
  final TaskCategory category;

  CategoryLoaded({required this.category});
}

class CategoryError extends CategoryState {
  final ApiError apiError;

  CategoryError({required this.apiError});
}
