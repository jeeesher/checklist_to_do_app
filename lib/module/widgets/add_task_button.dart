import 'package:flutter/material.dart';

class AddTaskButton extends StatelessWidget {
  final VoidCallback onPressed;
  final String label;

  const AddTaskButton({Key? key, required this.onPressed, required this.label}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color(0xFF4A3780),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
          padding: const EdgeInsets.symmetric(vertical: 20),
        ),
        child: Text(label, style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
      ),
    );
  }
}