import 'package:flutter/material.dart';
import 'package:todo_bloc/blocs/blocks_exports.dart';
import 'package:todo_bloc/components/button.dart';
import 'package:todo_bloc/components/input_field.dart';
import 'package:todo_bloc/components/section_wrapper.dart';
import 'package:todo_bloc/core/design_system.dart';

import '../components/custom_appbar.dart';
import '../components/page_scaffold.dart';
import '../core/models/task.dart';

class EditTaskView extends StatelessWidget {
  final Task oldTask;
  EditTaskView({
    Key? key,
    required this.oldTask,
  }) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleTextFieldController =
      TextEditingController();

  final TextEditingController _descriptionTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: DSSizes.lg),
        InputField(
          controller: _titleTextFieldController,
          inputFormatters: const [],
          placeholder: 'Add Title ',
          validator: (String? value) {},
        ),
        const SizedBox(height: DSSizes.md),
        InputField(
          controller: _descriptionTextFieldController,
          inputFormatters: const [],
          placeholder: 'Add description ',
          validator: (String? value) {},
        ),
        const SizedBox(height: DSSizes.md),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: Button(
                background: DSColors.backgroundBodyGrey,
                onPressed: () {
                  Navigator.pop(context);
                },
                text: "Cancel",
                textColor: DSColors.backgroundBodyDark,
              ),
            ),
            Expanded(
              child: Button(
                background: DSColors.primary,
                onPressed: () {
                  var editedTask = Task(
                      id: oldTask.id,
                      title: _titleTextFieldController.text,
                      description: _descriptionTextFieldController.text,
                      date: DateTime.now().toString());
                  context
                      .read<TasksBloc>()
                      .add(EditTask(newTask: editedTask, oldTask: oldTask));
                  Navigator.pop(context);
                },
                text: "Edit",
              ),
            ),
          ],
        )
      ],
    );
  }
}
