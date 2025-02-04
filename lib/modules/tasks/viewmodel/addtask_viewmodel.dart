import 'package:i_attend/import_all.dart';

class AddTaskViewModel extends BaseViewModel {
  TextEditingController taskTitleController = TextEditingController();
  TextEditingController taskDescriptionController = TextEditingController();
  TextEditingController taskDeadlineController = TextEditingController();
  TextEditingController taskPointController = TextEditingController();

  bool get isButtonEnabled {
    return taskTitleController.text.isNotEmpty &&
        taskDescriptionController.text.isNotEmpty &&
        taskDeadlineController.text.isNotEmpty &&
        taskPointController.text.isNotEmpty;
  }

  void updateButtonState() {
    notifyListeners();
  }
}
