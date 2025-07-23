import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/task/presentation/page/wigdets/task_text_field.dart';
import 'package:checklist_to_do_app/module/widgets/custom_app_bar.dart';
import 'package:checklist_to_do_app/module/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddTaskPage extends StatelessWidget {
  const AddTaskPage({super.key});

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    final TextEditingController taskController = TextEditingController();

    void saveTask() {
      if (formKey.currentState!.validate()) {
        final taskTitle = taskController.text.trim();

        context.read<TaskCubit>().addTask(taskTitle);

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Task saved successfully!')),
        );
        Navigator.of(context).pop();
      }
    }

    return Scaffold(
      backgroundColor: const Color(0xFFEFF2F5),
      appBar: CustomAppBar(
        title: 'Add New Task',
        actionIcon: Icons.close_rounded,
        tooltip: 'Cancel Adding Task',
        onActionPressed: () => Navigator.of(context).pop(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'What is your task?',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(height: 16),
                      TaskTextField(controller: taskController),
                    ],
                  ),
                ),
              ),
            ),

            CustomButton(
              onPressed: saveTask,
              label: 'Save Task',
              icon: Icons.download_rounded,
            ),
          ],
        ),
      ),
    );
  }
}
