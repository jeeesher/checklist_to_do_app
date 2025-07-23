
import 'dart:convert';
import 'package:checklist_to_do_app/module/task/data/model/task.model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TaskRepository {
  static const String _tasksKey = 'tasks';

  // Load tasks from SharedPreferences
  Future<List<TaskModel>> loadTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = prefs.getStringList(_tasksKey) ?? [];
      
      return tasksJson.map((taskJson) {
        final taskMap = json.decode(taskJson) as Map<String, dynamic>;
        return TaskModel.fromMap(taskMap);
      }).toList();
    } catch (e) {
      return [];
    }
  }

  // Save tasks to SharedPreferences
  Future<void> saveTasks(List<TaskModel> tasks) async {
    try {
      final prefs = await SharedPreferences.getInstance();
      final tasksJson = tasks.map((task) => json.encode(task.toMap())).toList();
      await prefs.setStringList(_tasksKey, tasksJson);
    } catch (e) {
      print('Error saving tasks: $e');
    }
  }

  // Clear all tasks
  Future<void> clearAllTasks() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.remove(_tasksKey);
    } catch (e) {
      print('Error clearing tasks: $e');
    }
  }
}