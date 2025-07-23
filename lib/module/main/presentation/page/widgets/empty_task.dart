import 'package:flutter/material.dart';

class EmptyTask extends StatelessWidget {
  const EmptyTask({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          Icon(Icons.checklist, size: 50, color: Colors.grey),
          SizedBox(height: 16),
          Text(
            'No tasks yet!',
            style: TextStyle(fontSize: 18, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text(
            'Add new task by clicking the button below.',
            style: TextStyle(color: Colors.grey, fontSize: 16),
          ),
        ],
      ),
    );
  }
}
