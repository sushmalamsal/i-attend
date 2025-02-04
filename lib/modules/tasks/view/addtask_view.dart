import '../../../import_all.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
      viewModelBuilder: () => AddTaskViewModel(),
      builder: (context, model, child) {
        return Scaffold(
          appBar: KAppbar(title: "Add Tasks"),
          body: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                KTextField(
                    labelText: "Title",
                    controller: model.taskTitleController,
                    onChanged: () => model.updateButtonState),
                const SizedBox(height: 16),
                KTextField(
                    labelText: "Description",
                    controller: model.taskDescriptionController,
                    onChanged: () => model.updateButtonState),
                const SizedBox(height: 16),
                KTextField(
                    labelText: "Deadline",
                    controller: model.taskDeadlineController,
                    onChanged: () => model.updateButtonState),
                const SizedBox(height: 16),
                KTextField(
                    labelText: "Points",
                    controller: model.taskPointController,
                    onChanged: () => model.updateButtonState),
                const SizedBox(height: 24),
                KDefaultButton(
                  label: "Add Task",
                  onPressed: model.isButtonEnabled
                      ? () {
                          print("Task Added!");
                        }
                      : () {},
                  borderColor: model.isButtonEnabled
                      ? Colors.orangeAccent
                      : Colors.grey.shade100,
                  labelColor:
                      model.isButtonEnabled ? Colors.orangeAccent : Colors.grey,
                  buttonColor: model.isButtonEnabled
                      ? Colors.white
                      : Colors.grey.shade100,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
