import 'package:i_attend/import_all.dart';

class AddTaskView extends StatelessWidget {
  const AddTaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<AddTaskViewModel>.reactive(
      viewModelBuilder: () =>
          AddTaskViewModel(AddTaskRepo(AddTaskDataSource())),
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
                  onChanged: model.updateButtonState,
                ),
                const SizedBox(height: 16),
                KTextField(
                  labelText: "Description",
                  controller: model.taskDescriptionController,
                  onChanged: model.updateButtonState,
                ),
                const SizedBox(height: 16),
                KTextField(
                  labelText: "Deadline",
                  controller: model.taskDeadlineController,
                  onChanged: model.updateButtonState,
                ),
                const SizedBox(height: 24),
                KDefaultButton(
                  label: "Add Task",
                  onPressed: model.isButtonEnabled
                      ? () {
                          String assigneeId = "6698a07567669cb755d5b988";
                          model.addTask(assigneeId, context);
                        }
                      : null,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
