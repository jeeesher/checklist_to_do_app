import 'package:checklist_to_do_app/module/main/presentation/page/checklist.page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ChecklistPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
