import 'package:checklist_to_do_app/module/widgets/add_task_button.dart';
import 'package:flutter/material.dart';

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
        title: const Text('My To-Do List',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Colors.white
            )),
        actions: [
          Container(
            margin: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white,
            ),
            child: IconButton(
              icon: const Icon(Icons.delete_outline_rounded, color: Color(0xFF4A3780)),
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text('All tasks cleared!')),
                );
              },
              tooltip: 'Clear All Tasks',
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: dummyTasks.isEmpty
                ? _buildEmptyState()
                : ListView.builder(
                    padding: const EdgeInsets.all(20),
                    itemCount: dummyTasks.length,
                    itemBuilder: (context, index) {
                      final task = dummyTasks[index];
                      return Card(
                        color: Colors.white,
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20),
                        ),
                        margin: const EdgeInsets.only(bottom: 8),
                        child: ListTile(
                          leading: Checkbox(
                            value: task['isCompleted'],
                            onChanged: (value) {
                              // No functionality yet
                            },
                            activeColor: Color(0xFF4A3780),
                            checkColor: Colors.white,
                          ),
                          title: Text(
                            task['title'],
                            style: TextStyle(
                              decoration: task['isCompleted']
                                  ? TextDecoration.lineThrough
                                  : null,
                              color: task['isCompleted']
                                  ? Colors.grey
                                  : Colors.black,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
          ),
          Padding(
            padding: const EdgeInsets.all(20),
            child: AddTaskButton(onPressed: () {}, label: 'Add New Task'),
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyState() {
    return Center(
      child: Text(
        'No tasks available. Tap the "+" button to add a new task.',
        style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        textAlign: TextAlign.center,
      ),
    );
  }
}