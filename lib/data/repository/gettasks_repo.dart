import 'package:i_attend/data/datasource/gettasks_datasource.dart';

class TaskDataRepository {
  final TaskDataSource _taskDataSource = TaskDataSource();

  Future<bool> updateCompletionStatus(String taskId, String studentId) async {
    final response =
        await _taskDataSource.updateCompletionStatus(taskId, studentId);

    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed to update task status');
    }
  }
}
