import 'package:checklist_to_do_app/module/main/presentation/page/widgets/confirm_dialog.dart';
import 'package:checklist_to_do_app/module/main/presentation/page/widgets/empty_task.dart';
import 'package:checklist_to_do_app/module/main/presentation/page/widgets/task_item.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_state.dart';
import 'package:checklist_to_do_app/module/task/presentation/page/add_task.page.dart';
import 'package:checklist_to_do_app/module/widgets/add_task_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistPage extends StatelessWidget {
  ChecklistPage({super.key});

  final List<Map<String, dynamic>> dummyTasks = [
    {'title': 'Buy groceries', 'isCompleted': false},
    {'title': 'Walk the dog', 'isCompleted': true},
    {'title': 'Finish Flutter exam', 'isCompleted': false},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEFF2F5),
      appBar: AppBar(
        backgroundColor: Color(0xFF4A3780),
        centerTitle: true,
        title: const Text(
          'My To-Do List',
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
                Icons.delete_outline_rounded,
                color: Color(0xFF4A3780),
                size: 20,
              ),
              onPressed: () => ConfirmDialog.show(
                context: context,
                title: 'Clear All Tasks',
                message: 'Are you sure you want to delete all tasks? This action cannot be undone.',
                confirmText: 'Clear All',
                onConfirm: () => context.read<TaskCubit>().clearAllTasks(),
              ),
              tooltip: 'Clear All Tasks',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: BlocBuilder<TaskCubit, TaskState>(
              builder: (context, state) {
                if (state is TaskLoading) {
                  return const Center(child: CircularProgressIndicator());
                }

                if (state is TaskLoaded) {
                  if (state.tasks.isEmpty) {
                    return const EmptyTaskState();
                  }

                  return ListView.builder(
                    padding: EdgeInsets.all(16),
                    itemCount: state.tasks.length,
                    itemBuilder: (context, index) {
                      final task = state.tasks[index];
                      return TaskItem(task: task);
                    },
                  );
                }

                if (state is TaskError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.error, size: 64, color: Colors.red),
                        SizedBox(height: 16),
                        Text(state.message),
                        SizedBox(height: 16),
                        ElevatedButton(
                          onPressed: () =>
                              context.read<TaskCubit>().loadTasks(),
                          child: Text('Retry'),
                        ),
                      ],
                    ),
                  );
                }

                return Center(child: Text('Something went wrong'));
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AddTaskButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskPage()),
                );
              },
              label: 'Add New Task',
            ),
          ),
        ],
      ),
    );
  }
}
