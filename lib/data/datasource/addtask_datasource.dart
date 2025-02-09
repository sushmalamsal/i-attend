import 'package:i_attend/import_all.dart';

abstract class IAddTaskDataSource {
  Future<Response> addTask({
    required String title,
    required String description,
    required String deadline,
    required List<String>? assigneeIDs,
  });
}

class AddTaskDataSource implements IAddTaskDataSource {
  static const String _baseUrl = "https://dev-demo.all-attend.com/dev-api/6969";
  static const String _logintoken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzkzNDQyNjEuNDc3LCJpYXQiOjE3Mzg3Mzk0NjEuNDc3LCJzdWIiOiI2NzhlMDFiNzZlMjJlZmY5ZmI0YzYwOGQiLCJyb2xlcyI6WyJVU0VSIiwiU1RVREVOVCJdLCJzY2hvb2xzIjpbIjY2MGQwNzY2ZjQ5ODE2NjJkY2Q2ZDI2MyJdfQ.71RN9PIPhehoRY1kTOI8_sdg7YNuRq9wya5vEglz1gA";

  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: _baseUrl,
      headers: {
        "Content-Type": "application/json",
        "Authorization": "Bearer $_logintoken",
      },
    ),
  );

  @override
  Future<Response> addTask({
    required String title,
    required String description,
    required String deadline,
    required List<String>? assigneeIDs,
  }) async {
    return await _dio.post(
      "/todos",
      data: {
        "title": title,
        "description": description,
        "deadline": deadline,
        "assignees": assigneeIDs,
      },
    );
  }
}
