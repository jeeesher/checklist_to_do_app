import 'package:checklist_to_do_app/app/color/app_color.dart';
import 'package:checklist_to_do_app/module/main/presentation/page/widgets/confirm_dialog.dart';
import 'package:checklist_to_do_app/module/main/presentation/page/widgets/empty_task.dart';
import 'package:checklist_to_do_app/module/main/presentation/page/widgets/task_item.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_state.dart';
import 'package:checklist_to_do_app/module/task/presentation/page/add_task.page.dart';
import 'package:checklist_to_do_app/module/widgets/custom_app_bar.dart';
import 'package:checklist_to_do_app/module/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChecklistPage extends StatelessWidget {
  const ChecklistPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundLight,
      appBar: CustomAppBar(
        title: 'My To-Do List',
        actionIcon: Icons.delete_outline_rounded,
        tooltip: 'Clear All Tasks',
        onActionPressed: () => ConfirmDialog.show(
          context: context,
          title: 'Clear All Tasks',
          message:
              'Are you sure you want to delete all tasks? This action cannot be undone.',
          confirmText: 'Clear All',
          onConfirm: () => context.read<TaskCubit>().clearAllTasks(),
        ),
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
                    return const EmptyTask();
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
                        Icon(Icons.error, size: 64, color: errorRed),
                        SizedBox(height: 16),
                        Text(state.message),
                        SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            foregroundColor: textWhite, backgroundColor: primaryColor,
                          ),
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
            child: CustomButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => AddTaskPage()),
                );
              },
              label: 'Add New Task',
              icon: Icons.add_rounded,
            ),
          ),
        ],
      ),
    );
  }
}
