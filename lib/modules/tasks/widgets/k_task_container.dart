import 'package:i_attend/common/k_textbutton.dart';
import 'package:i_attend/import_all.dart';
import 'package:rive/rive.dart';

class TaskContainer extends StatelessWidget {
  final String taskId;
  final String studentId;
  final String taskTitle;
  final String description;
  final String deadline;
  final String assigningEntity;
  final bool completed;
  final void Function() onPressed;

  const TaskContainer({
    super.key,
    required this.taskId,
    required this.studentId,
    required this.taskTitle,
    required this.deadline,
    required this.description,
    required this.assigningEntity,
    required this.completed,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<BookViewModel>.reactive(
        viewModelBuilder: () => BookViewModel(),
        builder: (context, model, child) {
          return completed
              ? Stack(
                  children: <Widget>[
                    RiveAnimation.asset(
                      'assets/closed_book.riv',
                      fit: BoxFit.contain,
                    ),
                    Positioned(
                      top: 15,
                      left: 30,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            taskTitle,
                            style: TextStyle(
                                fontSize: 8, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 2),
                          Icon(
                            Icons.check_circle_outline_outlined,
                            color: Colors.white,
                            size: 20,
                          ),
                          KSmallText(
                            text: "Completed",
                            textcolour: Colors.white,
                            fontSize: 8,
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              : Stack(
                  children: <Widget>[
                    RiveAnimation.asset(
                      'assets/book_flip.riv',
                      fit: BoxFit.contain,
                      onInit: model.onRiveInit,
                    ),
                    Positioned(
                      top: 10,
                      left: 20,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            taskTitle,
                            style: TextStyle(
                                fontSize: 8,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey.shade800),
                          ),
                          SizedBox(height: 2),
                          KSmallText(
                            text: "Description: $description",
                            textcolour: Colors.grey.shade800,
                            fontSize: 6,
                          ),
                          SizedBox(height: 2),
                          KSmallText(
                            text: 'Deadline: $deadline',
                            textcolour: Colors.grey.shade800,
                            fontSize: 6,
                          ),
                          KTextButton(
                            onPressed: () {
                              onPressed();
                            },
                          ),
                        ],
                      ),
                    ),
                  ],
                );
        });
  }
}
