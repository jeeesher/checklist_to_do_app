import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ClearAllDialog extends StatelessWidget {
  static Future<void> show(BuildContext context) {
    return showDialog<void>(
      context: context,
      builder: (dialogContext) => ClearAllDialog._(),
    );
  }

  const ClearAllDialog._();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Clear All Tasks'),
      content: Text(
        'Are you sure you want to delete all tasks? This action cannot be undone.',
      ),
      actions: [
        TextButton(
          onPressed: () => Navigator.pop(context),
          child: Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<TaskCubit>().clearAllTasks();
            Navigator.pop(context);
          },
          child: Text(
            'Clear All',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    );
  }
}