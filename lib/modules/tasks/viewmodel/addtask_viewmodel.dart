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

  Future<void> addTask(List<String>? assigneeIDs, BuildContext context) async {
    String title = taskTitleController.text;
    String description = taskDescriptionController.text;
    String deadline = taskDeadlineController.text;

    bool success = await _taskRepository.addTask(
      title: title,
      description: description,
      deadline: deadline,
      assigneeIDs: assigneeIDs,
    );

    if (success) {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text("Success"),
            content: const Text("Task added successfully!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context, true);
                  Navigator.pop(context, true);
                  // Navigator.popUntil(context, ()=>)
                },
                child: const Text("OK"),
              ),
            ],
          );
        },
      );
    } else {
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return AlertDialog(
            title: const Text("Failed"),
            content: const Text("Failed to add task. Try again."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  Navigator.pop(context);
                },
                child: const Text("cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Try again"),
              ),
            ],
          );
        },
      );
    }
  }
}
