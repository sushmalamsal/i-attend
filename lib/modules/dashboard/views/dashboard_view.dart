import 'package:i_attend/import_all.dart';
import 'package:i_attend/modules/tasks/view/tasks_view.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder.reactive(
        viewModelBuilder: () => DashboardViewModel(),
        builder: (context, model, child) {
          return Scaffold(
            body: Padding(
              padding: const EdgeInsets.only(top: 50),
              child: KContainer(
                  child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KLargeText(text: "Tasks, Points & Games"),
                        KSmallText(
                            text:
                                "Complete tasks to earn points and lay games with the earned points",
                            textcolour: Colors.grey),
                      ],
                    ),
                  ),
                  KDivider(),
                  KAvailablePointsContainer(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 40.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image.asset(
                                'assets/dollar.png',
                                width: 20,
                                height: 20,
                              ),
                              SizedBox(width: 4),
                              KLargeText(text: "Available Points")
                            ],
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            "1298",
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: Colors.orange.shade300,
                              fontFamily: "Fredoka",
                            ),
                          ),
                          SizedBox(
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              KIconButton(
                                  text: "Play Games",
                                  onpressed: () {},
                                  icon: Icons.games),
                              SizedBox(
                                width: 10,
                              ),
                              KIconButton(
                                  icon: Icons.list,
                                  text: "My Tasks",
                                  onpressed: () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => TasksView(),
                                      ),
                                    );
                                  })
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  KDivider(),
                  Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        KSmallText(
                            text: "Invite friends to get free points",
                            textcolour: Colors.orangeAccent),
                        SizedBox(
                          height: 6.0,
                        ),
                        KDefaultButton(
                            label: "Invite Friends", onPressed: () {})
                      ],
                    ),
                  )
                ],
              )),
            ),
          );
        });
  }
}
