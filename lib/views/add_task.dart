import 'package:flutter/material.dart';

import 'package:todo_bloc/components/button.dart';
import 'package:todo_bloc/components/input_field.dart';
import 'package:todo_bloc/components/page_scaffold.dart';
import 'package:todo_bloc/components/section_wrapper.dart';
import 'package:todo_bloc/core/design_system.dart';

import '../blocs/blocks_exports.dart';
import '../components/custom_appbar.dart';
import '../core/models/task.dart';
import '../core/services/guid_gen.dart';

class AddTaskView extends StatelessWidget {
  AddTaskView({super.key});

  final _formKey = GlobalKey<FormState>();

  final TextEditingController _titleTextFieldController =
      TextEditingController();

  final TextEditingController _descriptionTextFieldController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Container(
       padding: const EdgeInsets.all(20.0),
      child: Column(
        children: [
          const Text(
            'Add Task',
            style: TextStyle(fontSize: 24),
          ),
          const SizedBox(
            height: 10,
          ),
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
                  borderColor: DSColors.backgroundBodyGrey,
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
                    var task = Task(
                        id: GUIDGen.generate(),
                        title: _titleTextFieldController.text,
                        description: _descriptionTextFieldController.text,
                        date: DateTime.now().toString());
                    context.read<TasksBloc>().add(AddTask(task: task));
                    Navigator.pop(context);
                  },
                  text: "Add",
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
