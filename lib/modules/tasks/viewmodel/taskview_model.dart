import 'package:i_attend/data/datasource/gettasks_datasource.dart';
import 'package:i_attend/data/models/getmytasks.dart';
import 'package:i_attend/data/repository/gettasks_repo.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:stacked/stacked.dart';

class TaskViewModel extends BaseViewModel {
  final TaskDataSource _taskDataSource = TaskDataSource();
  final TaskDataRepository _taskDataRepository = TaskDataRepository();

  GetMyTasks? _data;
  GetMyTasks? get data => _data;

  String _errorMessage = "";
  String get errorMessage => _errorMessage;
/////////////////////load the tasks//////////////////
  Future<void> loadData() async {
    setBusy(true);
    try {
      print("hello");
      final fetchedData = await _taskDataSource.fetchData();
      print("hello $fetchedData");

      _data = fetchedData;
      _errorMessage = "";
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      setBusy(false);
    }
    notifyListeners();
  }

  bool _isExpanded = false;

  bool get isExpanded => _isExpanded;

  void toggleExpansion() {
    _isExpanded = !_isExpanded;
    notifyListeners();
  }

  Future<bool> getTaskStatus(String taskId) async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool(taskId) ?? false;
  }

  Future<void> markTaskAsDone(String taskId) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(taskId, true);
    notifyListeners();
  }

//////////////task status update////////////////////////
  Future<void> updateCompletionStatus(
    String taskId,
    String studentId,
  ) async {
    setBusy(true);
    try {
      bool isSuccess = await _taskDataRepository.updateCompletionStatus(
        taskId,
        studentId,
      );
      if (isSuccess) {
        loadData();
        print('Task status updated successfully!');
      }
    } catch (e) {
      print('Error: $e');
    } finally {
      setBusy(false);
    }
  }
}
