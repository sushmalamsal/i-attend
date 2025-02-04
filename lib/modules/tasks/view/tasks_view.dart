import 'package:i_attend/import_all.dart';

class TasksView extends StatefulWidget {
  const TasksView({super.key});

  @override
  State<TasksView> createState() => _TasksViewState();
}

class _TasksViewState extends State<TasksView> {
  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TasksViewModel>.reactive(
      viewModelBuilder: () => TasksViewModel(),
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
                    TaskcardView(
                        title: "School",
                        itemWidget: BookView(),
                        pointsText: "130"),
                    TaskcardView(
                        title: "Parent",
                        itemWidget: BookView(),
                        pointsText: "130"),
                    TaskcardView(
                        title: "self",
                        itemWidget: BookView(),
                        pointsText: "130"),
                    SizedBox(
                      height: 20,
                    ),
                    KDivider(),
                    Padding(
                        padding: EdgeInsets.all(12.0),
                        child: KDefaultButton(
                            label: "Add Task",
                            onPressed: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => AddTaskView(),
                                ),
                              );
                            }))
                  ],
                ),
              ),
            ));
      },
    );
  }
}
