import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/widgets/add_task_button.dart';
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
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFF4A3780),
        title: const Text(
          'Add New Task',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(
                Icons.close_rounded,
                color: Color(0xFF4A3780),
                size: 22,
              ),
              onPressed: () => Navigator.of(context).pop(),
              tooltip: 'Cancel Adding Task',
            ),
          ),
        ],
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
                      TextFormField(
                        controller: taskController,
                        style: const TextStyle(fontSize: 16),
                        decoration: InputDecoration(
                          hintText: 'Enter your task here...',
                          hintStyle: const TextStyle(
                            fontSize: 16,
                            color: Colors.grey,
                          ),
                          filled: true,
                          fillColor: Colors.white,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(color: Colors.grey),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(12),
                            borderSide: const BorderSide(
                              color: Color(0xFF4A3780),
                              width: 2,
                            ),
                          ),
                        ),
                        maxLines: 3,
                        maxLength: 200,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return 'Please enter a task description';
                          }
                          if (value.trim().length < 3) {
                            return 'Task must be at least 3 characters long';
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),

            AddTaskButton(
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
