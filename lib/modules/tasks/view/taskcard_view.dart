import 'package:i_attend/import_all.dart';
import 'package:i_attend/modules/tasks/viewmodel/taskview_model.dart';
import 'package:i_attend/modules/tasks/widgets/k_task_container.dart';
import 'package:intl/intl.dart';

class TaskcardView extends StatelessWidget {
  const TaskcardView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<TaskViewModel>.reactive(
      viewModelBuilder: () => TaskViewModel(),
      onModelReady: (model) => model.loadData(),
      builder: (context, model, child) {
        if (model.isBusy) {
          return const Center(child: CircularProgressIndicator());
        }

        if (model.errorMessage.isNotEmpty) {
          return Center(child: Text("Error: ${model.errorMessage}"));
        }

        if (model.data == null || model.data!.data == null) {
          return const Center(child: Text("No data available"));
        }

        final tasks = model.data!.data!.docs ?? [];

        if (tasks.isEmpty) {
          return const Center(child: Text("No tasks available"));
        }

        final Map<String, List<dynamic>> groupedTasks = {};
        for (var task in tasks) {
          final entity = task.assigningEntity ?? "Unknown";
          groupedTasks.putIfAbsent(entity, () => []).add(task);
        }

        return Column(
          children: groupedTasks.entries.map((entry) {
            final entityName = entry.key;
            final entityTasks = entry.value;

            return TaskCategoryCard(
              title: entityName,
              pointsText: "100",
              tasks: entityTasks,
            );
          }).toList(),
        );
      },
    );
  }
}

class TaskCategoryCard extends ViewModelWidget<TaskViewModel> {
  final String title;
  final String pointsText;
  final List<dynamic> tasks;

  const TaskCategoryCard({
    super.key,
    required this.title,
    required this.pointsText,
    required this.tasks,
  });

  @override
  Widget build(
    BuildContext context,
    TaskViewModel viewModel,
  ) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 400),
        height: viewModel.isExpanded ? 500 : 160,
        width: double.infinity,
        decoration: BoxDecoration(
          color: Colors.white30,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Colors.grey[300]!, width: 1),
        ),
        child: Padding(
          padding: const EdgeInsets.all(6.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey.shade700,
                    ),
                  ),
                  Row(
                    children: [
                      Image.asset(
                        'assets/dollar.png',
                        width: 20,
                        height: 20,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        pointsText,
                        style: GoogleFonts.permanentMarker(
                          fontSize: 12,
                          color: const Color(0xFFDA9910),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    crossAxisSpacing: 8,
                    mainAxisSpacing: 8,
                    childAspectRatio: 1.2,
                  ),
                  itemCount: viewModel.isExpanded
                      ? tasks.length
                      : (tasks.length < 3 ? tasks.length : 3),
                  itemBuilder: (context, index) {
                    final task = tasks[index];

                    String formattedDeadline = "";
                    if (task.deadline != null) {
                      try {
                        final date = DateTime.parse(task.deadline ?? "");
                        formattedDeadline =
                            DateFormat('yyyy-MM-dd').format(date);
                      } catch (e) {
                        formattedDeadline = "Invalid Date";
                      }
                    } else {
                      formattedDeadline = "No Deadline";
                    }
                    final bool isCompleted = task.assignees
                            ?.any((assignee) => assignee.completed == true) ??
                        false;
                    return TaskContainer(
                      taskTitle: task.title ?? "No Title",
                      description: task.description ?? "No Description",
                      deadline: formattedDeadline,
                      assigningEntity: task.assigningEntity ?? "",
                      completed: isCompleted,
                      taskId: task.sId,
                      studentId: task.assignees?.first.user?.sId ?? "",
                      onPressed: () async {
                        await viewModel.updateCompletionStatus(
                          task.sId,
                          task.assignees?.first.user?.sId,
                        );
                      },
                      // onPressed: (taskId, studentId) {
                      //   print('Task ID: $taskId');
                      //   print('Student ID: $studentId');
                      // },
                    );
                  },
                ),
              ),
              InkWell(
                onTap: viewModel.toggleExpansion,
                child: Padding(
                  padding: const EdgeInsets.only(top: 6.0),
                  child: Text(
                    viewModel.isExpanded ? 'Collapse' : 'Expand',
                    style: const TextStyle(
                      fontSize: 8,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
