import 'package:i_attend/import_all.dart';

class AddTaskViewModel extends BaseViewModel {
  final AddTaskRepo _taskRepository;

  AddTaskViewModel(this._taskRepository);

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

  Future<void> addTask(String assigneeId, BuildContext context) async {
    String title = taskTitleController.text;
    String description = taskDescriptionController.text;
    String deadline = taskDeadlineController.text;

    bool success = await _taskRepository.addTask(
      title: title,
      description: description,
      deadline: deadline,
      assigneeID: assigneeId,
    );

    if (success) {
      showSnackbar(context, "Task added successfully!", true);
    } else {
      showSnackbar(context, "Failed to add task. Try again.", false);
    }
  }

  void showSnackbar(BuildContext context, String message, bool isSuccess) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        backgroundColor: isSuccess ? Colors.green : Colors.red,
      ),
    );
  }
}
