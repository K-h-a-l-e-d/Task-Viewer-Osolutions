import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:task_viewer/core/network/api_client.dart';
import 'package:task_viewer/models/category.dart';

part 'category_state.dart';

class CategoryCubit extends Cubit<CategoryState> {
  CategoryCubit() : super(CategoryInitial());

  final ApiClient _apiClient = ApiClient();

  Future<void> getCategoryById(int id) async {
    try {
      emit(CategoryLoading());
      final category = await _apiClient.getCategoryById(id: id);
      emit(CategoryLoaded(category: category));
    } catch (e) {
      emit(CategoryError(error: e.toString()));
    }
  }
}
