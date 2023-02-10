import 'package:flutter/material.dart';

import '../blocs/blocks_exports.dart';
import '../core/models/task.dart';
import '../widgets/tasks_list.dart';

class CompletedTaskView extends StatefulWidget {
  const CompletedTaskView({super.key});

  static const id = "tasks_screen";

  @override
  State<CompletedTaskView> createState() => _CompletedTaskViewState();
}

class _CompletedTaskViewState extends State<CompletedTaskView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasks = state.completedTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasks.length} Tasks',
                ),
              ),
            ),
            TasksList(tasks: tasks)
          ],
        );
      },
    );
  }
}
