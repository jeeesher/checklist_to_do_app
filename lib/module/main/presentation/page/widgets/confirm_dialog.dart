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
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text('Cancel', style: TextStyle(color: Color(0xFF4A3780))),
        ),
        ElevatedButton(
          onPressed: () {
            context.read<TaskCubit>().clearAllTasks();
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: const Color(0xFF4A3780),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text('Clear All', style: TextStyle(color: Colors.white)),
        ),
      ],
    );
  }
}
