import 'package:checklist_to_do_app/module/main/presentation/page/checklist.page.dart';
import 'package:checklist_to_do_app/module/task/data/datasource/task.datasource.dart';
import 'package:checklist_to_do_app/module/task/data/repositories/task.repository.dart';
import 'package:checklist_to_do_app/module/task/domain/cubit/task_cubit.dart';
import 'package:checklist_to_do_app/module/widgets/error_handler.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => TaskCubit(TaskRepository(dataSource: TaskDataSource()))..loadTasks(),
      child: MaterialApp(
        title: 'Checklist To-Do App',
        theme: ThemeData(
          textTheme: GoogleFonts.poppinsTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: ChecklistPage(),
        debugShowCheckedModeBanner: false,
        navigatorKey: ErrorHandler.navigatorKey,
      ),
    );
  }
}
