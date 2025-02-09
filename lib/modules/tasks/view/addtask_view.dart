import 'package:i_attend/common/k_datetime_field.dart';
import 'package:i_attend/import_all.dart';

class AddTaskView extends StatelessWidget {
  final VoidCallback? onTaskAdded;
  const AddTaskView({super.key, this.onTaskAdded});

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
                KDateTimeField(
                  labelText: "Deadline",
                  controller: model.taskDeadlineController,
                  onChanged: model.updateButtonState,
                ),
                const SizedBox(height: 24),
                KDefaultButton(
                  label: "Add Task",
                  onPressed: model.isButtonEnabled
                      ? () {
                          List<String>? assigneeIDs = [
                            "678e01b76e22eff9fb4c608d"
                          ];
                          model.addTask(assigneeIDs, context);
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
