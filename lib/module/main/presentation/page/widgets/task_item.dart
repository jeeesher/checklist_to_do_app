import 'package:checklist_to_do_app/module/task/data/model/task.model.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final TaskModel task;

  const TaskItem({
    Key? key,
    required this.task,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.white,
      elevation: 0.5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      margin: EdgeInsets.only(bottom: 8),
      child: ListTile(
        horizontalTitleGap: 0,
        contentPadding:  EdgeInsets.all(5),
        leading: Checkbox(
          value: task.isCompleted,
          onChanged: (_) => context.read<TaskCubit>().toggleTask(task.id),
          activeColor: const Color(0xFF4A3780),
        ),
        title: Text(
          task.title,
          style: TextStyle(
            decoration: task.isCompleted ? TextDecoration.lineThrough : null,
            color: task.isCompleted ? Colors.grey : Colors.black,
          ),
        ),
      ),
    );
  }
}