import 'package:checklist_to_do_app/app/color/app_color.dart';
import 'package:flutter/material.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.checklist, size: 50, color: textGrey),
          SizedBox(height: 16),
          Text(
            'No tasks yet!',
            style: TextStyle(fontSize: 18, color: textGrey, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Add new task by clicking the button below.',
            style: TextStyle(color: textGrey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
