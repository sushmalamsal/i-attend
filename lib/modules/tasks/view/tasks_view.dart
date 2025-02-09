import 'package:i_attend/import_all.dart';
import 'package:i_attend/modules/tasks/viewmodel/taskview_model.dart';

class TasksView extends StatelessWidget {
  const TasksView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(),
      builder: (context, model, child) {
        return Scaffold(
            appBar: KAppbar(title: "My Tasks"),
            body: KContainer(
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          kFloatingText(),
                          KProgressbar(progress: 0.9, width: 330),
                        ],
                      ),
                    ),
                    KDivider(),
                    TaskcardView(),
                    SizedBox(
                      height: 20,
                    ),
                    KDivider(),
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: KDefaultButton(
                            label: "Add Task",
                            onPressed: () async {
                              final result = await Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => AddTaskView(
                                      onTaskAdded: () {
                                        model.loadData();
                                      },
                                    ),
                                  )).then(
                                (value) {
                                  model.loadData();
                                },
                              );
                              print(result);
                              if (result != null && result is bool && result) {
                                print(result);

                                model.loadData();
                              }
                            }))
                  ],
                ),
              ),
            ));
      },
    );
  }
}
