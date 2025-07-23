import 'dart:convert';
import 'package:shared_preferences/shared_preferences.dart';
import '../model/task.model.dart';

class TaskDataSource {
  static const String _tasksKey = 'tasks';

  Future<List<TaskModel>> loadTasks() async {
    final taskPreference = await SharedPreferences.getInstance();
    final tasksJson = taskPreference.getStringList(_tasksKey) ?? [];

    return tasksJson.map((jsonString) {
      final map = json.decode(jsonString) as Map<String, dynamic>;
      return TaskModel.fromMap(map);
    }).toList();
  }

  Future<void> saveTasks(List<TaskModel> tasks) async {
    final taskPreference = await SharedPreferences.getInstance();
    final tasksJson =
        tasks.map((task) => json.encode(task.toMap())).toList();
    await taskPreference.setStringList(_tasksKey, tasksJson);
  }

  Future<void> clearAllTasks() async {
    final taskPreference = await SharedPreferences.getInstance();
    await taskPreference.remove(_tasksKey);
  }
}
