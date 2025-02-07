import 'package:i_attend/common/k_textbutton.dart';
import 'package:i_attend/import_all.dart';

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
    return completed
        ? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task: $taskTitle",
                  style: TextStyle(fontSize: 8, fontWeight: FontWeight.bold)),
              SizedBox(height: 2),
              Icon(
                Icons.check_circle_outline_outlined,
                color: Colors.lightGreen,
                size: 50,
              ),
              KSmallText(
                text: "Status: Completed",
                textcolour: Colors.lightGreen,
                fontSize: 8,
              ),
            ],
          )
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Task: $taskTitle",
                  style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade800)),
              SizedBox(height: 2),
              KSmallText(
                text: "Description: $description",
                textcolour: Colors.grey.shade800,
                fontSize: 8,
              ),
              SizedBox(height: 2),
              KSmallText(
                text: 'Deadline: $deadline',
                textcolour: Colors.grey.shade800,
                fontSize: 8,
              ),
              KTextButton(
                // taskId: taskId,
                // studentId: studentId,
                onPressed: () {
                  onPressed();
                },
              ),
            ],
          );
  }
}
