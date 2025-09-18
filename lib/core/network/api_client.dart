import 'package:dio/dio.dart';
import 'package:task_viewer/core/network/api_constants.dart';
import 'package:task_viewer/models/category.dart';
import 'package:task_viewer/models/task.dart';

enum Priority { high, medium, low }

Map<Priority, String> _priorityToString = {
  Priority.high: 'eq.high',
  Priority.medium: 'eq.medium',
  Priority.low: 'eq.low',
};

class ApiClient {
  final Dio _dio = Dio(
    BaseOptions(baseUrl: ApiConstants.tasksApiBaseUrl, headers: ApiConstants.headers),
  );

  Future<List<Task>?> getTasks({
    int? limit,
    int? offset,
    int? categoryId,
    bool? completed,
    Priority? priority,
  }) async {
    try {
      final response = await _dio.get(
        '/tasks?order=created_at.desc',
        queryParameters: {
          'limit': limit,
          'offset': offset,
          'category_id': categoryId != null ? 'eq.$categoryId' : null,
          'completed': completed != null ? 'eq.$completed' : null,
          'priorty': _priorityToString[priority],
        },
      );
      if (response.statusCode == 200) {
        return (response.data as List).map((json) => Task.fromJson(json)).toList();
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<TaskCategory> getCategoryById({required int id}) async {
    try {
      final response = await _dio.get('/categories?id=eq.$id');
      if (response.statusCode == 200) {
        return TaskCategory.fromJson((response.data as List).first);
      } else {
        return response.data;
      }
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updateTaskCompletionStatus(int id, bool completed) async {
    await _dio.patch('/tasks?id=eq.$id', data: {'completed': !completed ? true : false});
  }
}
