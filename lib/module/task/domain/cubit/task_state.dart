import 'package:checklist_to_do_app/module/task/domain/entity/task.entity.dart';


abstract class TaskState {}

class TaskInitial extends TaskState {}

class TaskLoading extends TaskState {}

class TaskLoaded extends TaskState {
  final List<TaskEntity> tasks;

  TaskLoaded(this.tasks);
}

class TaskError extends TaskState {
  final String message;

  TaskError(this.message);
}