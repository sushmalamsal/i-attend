import 'package:i_attend/import_all.dart';

class AddTaskRepo {
  final IAddTaskDataSource _dataSource;

  AddTaskRepo(this._dataSource);

  Future<bool> addTask({
    required String title,
    required String description,
    required String deadline,
    required String assigneeID,
  }) {
    return _dataSource.addTask(
      title: title,
      description: description,
      deadline: deadline,
      assigneeID: assigneeID,
    );
  }
}
