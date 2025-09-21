import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:task_viewer/core/network/api_constants.dart';
import 'package:task_viewer/models/api_error.dart';
import 'package:task_viewer/models/category.dart';
import 'package:task_viewer/models/task.dart';

enum Priority { high, medium, low }

//mapping priorty Strings that were mentioned in API docs
//to an enum for an Easier and Cleaner passing of Arguments
Map<Priority, String> _priorityToString = {
  Priority.high: 'eq.high',
  Priority.medium: 'eq.medium',
  Priority.low: 'eq.low',
};

class ApiClient {
  final Dio _dio = Dio(
    //providing the url and necessary headers mentioned in the api docs
    //in order to be able to perform CRUD Operations.
    BaseOptions(baseUrl: ApiConstants.tasksApiBaseUrl, headers: ApiConstants.headers),
  );

  Future<Either<ApiError, List<TaskModel>>> getTasks({
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
      return Right(
        //looping through each the fetched list of json map and converting each
        //Task Map to a Task Model then converting the Iterable of TaskModels returned
        //from map function to List of TaskModel
        (response.data as List).map((json) => TaskModel.fromJson(json)).toList(),
      );
    } on DioException catch (e) {
      return Left(ApiError.fromJson(e.response?.data));
    }
  }

  Future<Either<ApiError, TaskCategory>> getCategoryById({required int id}) async {
    try {
      final response = await _dio.get('/categories?id=eq.$id');
      return Right(TaskCategory.fromJson((response.data as List).first));
    } on DioException catch (e) {
      return Left(ApiError.fromJson(e.response as Map<String, dynamic>));
    }
  }

  Future<Either<ApiError, Unit>> updateTaskCompletionStatus(
    int id,
    bool completed,
  ) async {
    try {
      await _dio.patch(
        '/tasks?id=eq.$id',
        data: {'completed': !completed ? true : false},
      );
      return const Right(unit);
    } on DioException catch (e) {
      return Left(ApiError.fromJson(e.response as Map<String, dynamic>));
    }
  }
}
