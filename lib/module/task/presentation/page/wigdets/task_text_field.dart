import 'package:checklist_to_do_app/app/color/app_color.dart';
import 'package:flutter/material.dart';

class TaskTextField extends StatelessWidget {
  final TextEditingController controller;

  const TaskTextField({super.key, required this.controller});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      style: const TextStyle(fontSize: 16),
      decoration: InputDecoration(
        hintText: 'Enter your task here...',
        hintStyle: const TextStyle(
          fontSize: 16,
          color: textGrey,
        ),
        filled: true,
        fillColor: backgroundWhite,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: backgroundGrey),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: primaryColor,
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
    );
  }
}
