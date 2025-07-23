import 'package:checklist_to_do_app/app/color/app_color.dart';
import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final String confirmText;
  final VoidCallback onConfirm;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    this.confirmText = 'Confirm',
  });

  static Future<void> show({
    required BuildContext context,
    required String title,
    required String message,
    required VoidCallback onConfirm,
    String confirmText = 'Confirm',
  }) {
    return showDialog<void>(
      context: context,
      builder: (_) => ConfirmDialog(
        title: title,
        message: message,
        onConfirm: onConfirm,
        confirmText: confirmText,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      backgroundColor: backgroundWhite,
      title: Text(title, style: TextStyle(fontWeight: FontWeight.bold)),
      content: Text(message),
      actions: [
        // Cancel button
        ElevatedButton(
          onPressed: () => Navigator.pop(context),
          style: ElevatedButton.styleFrom(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: const Text(
            'Cancel',
            style: TextStyle(color: primaryColor),
          ),
        ),

        ElevatedButton(
          onPressed: () {
            onConfirm(); 
            Navigator.pop(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: primaryColor,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
          child: Text(confirmText, style: const TextStyle(color: textWhite)),
        ),
      ],
    );
  }
}
