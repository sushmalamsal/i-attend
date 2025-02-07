import 'package:i_attend/import_all.dart';

class AddTaskRepo {
  final IAddTaskDataSource _dataSource;
  AddTaskRepo(this._dataSource);

  Future<bool> addTask({
    required String title,
    required String description,
    required String deadline,
    required List<String>? assigneeIDs,
  }) async {
    try {
      final response = await _dataSource.addTask(
        title: title,
        description: description,
        deadline: deadline,
        assigneeIDs: assigneeIDs,
      );

      if (response.statusCode == 201) {
        print("Task added successfully: ${response.data}");
        return true;
      } else {
        print("Failed to add task: ${response.data}");
        return false;
      }
    } catch (e) {
      print("Error adding task: $e");
      return false;
    }
  }
}
