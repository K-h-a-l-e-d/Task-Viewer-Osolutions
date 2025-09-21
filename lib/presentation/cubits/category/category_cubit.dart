import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/core/network/api_client.dart';
import 'package:task_viewer/models/api_error.dart';
import 'package:task_viewer/models/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> getCategoryById(int id) async {
    emit(CategoryLoading());
    final response = await _apiClient.getCategoryById(id: id);
    response.fold(
      (apiError) => emit(CategoryError(apiError: apiError)),
      (category) => emit(CategoryLoaded(category: category)),
    );
  }
}
