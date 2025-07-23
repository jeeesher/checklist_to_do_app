import 'package:checklist_to_do_app/module/task/data/model/task.model.dart';
import 'package:checklist_to_do_app/module/task/data/repositories/task.repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'task_state.dart';

class TaskCubit extends Cubit<TaskState> {
  final TaskRepository repository;
  List<TaskModel> _tasks = [];

  TaskCubit(this.repository) : super(TaskInitial());

  // Load tasks from storage
  Future<void> loadTasks() async {
    emit(TaskLoading());
    try {
      _tasks = await repository.loadTasks();
      emit(TaskLoaded(_tasks));
    } catch (e) {
      emit(TaskError('Failed to load tasks'));
    }
  }

  // Add a new task
  Future<void> addTask(String title) async {
    if (title.trim().isEmpty) return;

    final newTask = TaskModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      title: title.trim(),
      isCompleted: false,
    );

    _tasks.add(newTask);
    await repository.saveTasks(_tasks);
    emit(TaskLoaded(_tasks));
  }

  // Toggle task completion
  Future<void> toggleTask(String taskId) async {
    _tasks = _tasks.map((task) {
      if (task.id == taskId) {
        return task.copyWith(isCompleted: !task.isCompleted);
      }
      return task;
    }).toList();

    await repository.saveTasks(_tasks);
    emit(TaskLoaded(_tasks));
  }

  // Clear all tasks
  Future<void> clearAllTasks() async {
    _tasks.clear();
    await repository.clearAllTasks();
    emit(TaskLoaded(_tasks));
  }

  Future<void> deleteTask(String taskId) async {
    _tasks.removeWhere((task) => task.id == taskId);
    await repository.saveTasks(_tasks);
    emit(TaskLoaded(_tasks));
  }
}