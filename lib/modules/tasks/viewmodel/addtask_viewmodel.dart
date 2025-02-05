import 'package:i_attend/import_all.dart';

class AddTaskViewModel extends BaseViewModel {
  final AddtaskRepo _taskRepository = AddtaskRepo();

  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskDeadlineController = TextEditingController();

  bool get isButtonEnabled {
    return taskTitleController.text.isNotEmpty &&
        taskDescriptionController.text.isNotEmpty &&
        taskDeadlineController.text.isNotEmpty;
  }

  void updateButtonState() {
    notifyListeners();
  }

  Future<void> addTask(String assigneeId) async {
    String title = taskTitleController.text;
    String description = taskDescriptionController.text;
    String deadline = taskDeadlineController.text;

    await _taskRepository.addTask(
      title: title,
      description: description,
      deadline: deadline,
      assigneeID: assigneeId,
    );
  }
}
