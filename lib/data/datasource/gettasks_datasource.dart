import 'package:dio/dio.dart';
import 'package:i_attend/data/models/getmytasks.dart';

class TaskDataSource {
  final Dio _dio = Dio();

  static const String _baseUrl =
      'https://dev-demo.all-attend.com/dev-api/6969/';
  static const String _token =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzkzNDQyNjEuNDc3LCJpYXQiOjE3Mzg3Mzk0NjEuNDc3LCJzdWIiOiI2NzhlMDFiNzZlMjJlZmY5ZmI0YzYwOGQiLCJyb2xlcyI6WyJVU0VSIiwiU1RVREVOVCJdLCJzY2hvb2xzIjpbIjY2MGQwNzY2ZjQ5ODE2NjJkY2Q2ZDI2MyJdfQ.71RN9PIPhehoRY1kTOI8_sdg7YNuRq9wya5vEglz1gA";

  TaskDataSource() {
    _dio.options = BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        'Authorization': 'Bearer $_token',
      },
    );
  }

  Future<GetMyTasks> fetchData() async {
    const String url = "todos/mine";
    try {
      final response = await _dio.get(url);
      return GetMyTasks.fromJson(response.data);
    } catch (e) {
      throw Exception("Failed to fetch data: $e");
    }
  }

  Future<Response> updateCompletionStatus(
    String taskId,
    String studentId,
  ) async {
    try {
      final response = await _dio.put(
        "todos/completed/$taskId/$studentId",
      );
      return response;
    } on DioException catch (e) {
      throw Exception(e.message);
    }
  }
}
