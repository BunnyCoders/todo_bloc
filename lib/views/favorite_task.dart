import 'package:flutter/material.dart';

import '../blocs/blocks_exports.dart';
import '../core/models/task.dart';
import '../widgets/tasks_list.dart';

class FavoriteTaskView extends StatefulWidget {
  const FavoriteTaskView({super.key});
  static const id = "tasks_screen";
  @override
  State<FavoriteTaskView> createState() => _FavoriteTaskViewState();
}

class _FavoriteTaskViewState extends State<FavoriteTaskView> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TasksBloc, TasksState>(
      builder: (context, state) {
        List<Task> tasks = state.favoriteTasks;
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
