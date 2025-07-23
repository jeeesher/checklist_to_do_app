
import 'package:checklist_to_do_app/module/task/data/datasource/task.datasource.dart';
import 'package:checklist_to_do_app/module/task/data/model/task.model.dart';
import 'package:checklist_to_do_app/module/task/domain/entity/task.entity.dart';
import 'package:checklist_to_do_app/module/widgets/error_handler.dart';

class TaskRepository {
  final TaskDataSource dataSource;

  TaskRepository({required this.dataSource});

  Future<List<TaskEntity>> loadTasks() async {
    try {
      final models = await dataSource.loadTasks();
      return models.map((model) => TaskEntity(
        id: model.id,
        title: model.title,
        isCompleted: model.isCompleted,
      )).toList();
    } catch (e) {
      ErrorHandler.showErrorDialog("Failed to load tasks: $e");
      return [];
    }
  }

  Future<void> saveTasks(List<TaskEntity> tasks) async {
    try {
      final models = tasks.map((task) => TaskModel(
        id: task.id,
        title: task.title,
        isCompleted: task.isCompleted,
      )).toList();
      await dataSource.saveTasks(models);
    } catch (e) {
      ErrorHandler.showErrorDialog("Failed to save tasks: $e");
    }
  }

  Future<void> clearAllTasks() async {
    try {
      await dataSource.clearAllTasks();
    } catch (e) {
      ErrorHandler.showErrorDialog("Failed to clear tasks: $e");
    }
  }
}