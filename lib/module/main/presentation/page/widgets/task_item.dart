import 'package:checklist_to_do_app/module/main/presentation/page/widgets/confirm_dialog.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/task/presentation/view_model/task.view_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TaskItem extends StatelessWidget {
  final TaskViewModel task;

  const TaskItem({super.key, required this.task});

  @override
  Widget build(BuildContext context) {
    final isCompleted = task.isCompleted;

    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 15),
      decoration: BoxDecoration(
        color: isCompleted ? Colors.grey.shade300 : Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Checkbox(
            value: isCompleted,
            onChanged: (value) {
              context.read<TaskCubit>().toggleTask(task.id);
            },
            visualDensity: VisualDensity.compact,
            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),

          const SizedBox(width: 5),

          Expanded(
            child: Text(
              task.title,
              style: TextStyle(
                fontSize: 16,
                color: isCompleted ? const Color(0xFF8E8E8E) : Colors.black,
                decoration: isCompleted ? TextDecoration.lineThrough : null,
                decorationColor: const Color(0xFF4A3780),
                decorationThickness: 1,
              ),
            ),
          ),

          const SizedBox(width: 5),

          Tooltip(
            message: 'Delete Task',
            child: GestureDetector(
              onTap: () {
                ConfirmDialog.show(
                  context: context,
                  title: 'Delete Task',
                  message: 'Are you sure you want to delete this task?',
                  confirmText: 'Delete',
                  onConfirm: () =>
                      context.read<TaskCubit>().deleteTask(task.id),
                );
              },
              child: const Icon(
                Icons.delete_outline_rounded,
                color: Color(0xFF4A3780),
                size: 24,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
