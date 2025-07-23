import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/task.model.dart';

class TaskDataSource {
  static const String _tasksKey = 'tasks';

  Future<List<TaskModel>> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson = prefs.getStringList(_tasksKey) ?? [];

    return tasksJson.map((jsonString) {
      final map = json.decode(jsonString) as Map<String, dynamic>;
      return TaskModel.fromMap(map);
    }).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final prefs = await SharedPreferences.getInstance();
    final tasksJson =
        tasks.map((task) => json.encode(task.toMap())).toList();
    await prefs.setStringList(_tasksKey, tasksJson);
  }

  Future<void> clearAllTasks() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_tasksKey);
  }
}
