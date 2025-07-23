import 'package:checklist_to_do_app/module/main/presentation/page/checklist.page.dart';
import 'package:checklist_to_do_app/module/task/data/repositories/task.repository.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(TaskRepository())..loadTasks(),
      child: MaterialApp(
        title: 'Checklist To-Do App',
        home: ChecklistPage(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
