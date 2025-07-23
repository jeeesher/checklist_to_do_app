import 'package:checklist_to_do_app/module/task/domain/entity/task.entity.dart';

class TaskViewModel {
  final String id;
  final String title;
  final bool isCompleted;
  
  TaskViewModel({
    required this.id,
    required this.title,
    required this.isCompleted,
  });

  factory TaskViewModel.fromEntity(TaskEntity entity) {
    return TaskViewModel(
      id: entity.id,
      title: entity.title,
      isCompleted: entity.isCompleted,
    );
  }
}
