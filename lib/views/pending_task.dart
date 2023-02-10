import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../blocs/blocks_exports.dart';
import '../core/models/task.dart';
import '../widgets/tasks_list.dart';

class PendingTaskView extends StatefulWidget {
  const PendingTaskView({super.key});
  static const id = "tasks_screen";
  @override
  State<PendingTaskView> createState() => _PendingTaskViewState();
}

class _PendingTaskViewState extends State<PendingTaskView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasks = state.pendingTasks;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Chip(
                label: Text(
                  '${tasks.length} Pending | ${state.completedTasks.length} Completed',
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
