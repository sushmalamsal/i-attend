import 'package:http/http.dart' as http;
import 'dart:convert';

/// Abstract class
abstract class IAddTaskDataSource {
  Future<bool> addTask({
    required String title,
    required String description,
    required String deadline,
    required String assigneeID,
  });
}

class AddTaskDataSource implements IAddTaskDataSource {
  static const String _baseUrl = "https://dev-demo.all-attend.com/dev-api/6969";
  static const String _logintoken =
      "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MzkyNzE4NjAuMjA2LCJpYXQiOjE3Mzg2NjcwNjAuMjA2LCJzdWIiOiI2NjBkMDMwOGYwOTIyZmZkNmQyZTUzODQiLCJyb2xlcyI6WyJVU0VSIiwiQlRfQURNSU4iXSwic2Nob29scyI6W119.WySsmxgS2KSusMt4MPMRg-bzeUx6OS-v_MTpl7NuKro";

  @override
  Future<bool> addTask({
    required String title,
    required String description,
    required String deadline,
    required String assigneeID,
  }) async {
    final url = Uri.parse("$_baseUrl/todos");

    try {
      final response = await http.post(
        url,
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $_logintoken",
        },
        body: jsonEncode({
          "title": title,
          "description": description,
          "deadline": deadline,
          "assignee": assigneeID,
        }),
      );

      if (response.statusCode == 201) {
        print("Success: ${response.body}");
        return true;
      } else {
        print("Error: ${response.body}");
        return false;
      }
    } catch (e) {
      print("Exception: $e");
      return false;
    }
  }
}
