import 'package:flutter/material.dart';

class ErrorHandler {
  static final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  static void showErrorDialog(String message, {String title = "Error"}) {
    final context = navigatorKey.currentContext;
    if (context == null) {
      debugPrint("Error dialog cannot be shown: $message");
      return;
    }

    ScaffoldMessenger.of(context).clearSnackBars(); // remove previous

    final snackBar = SnackBar(
      content: Row(
        children: [
          const Icon(Icons.error_outline, color: Colors.white),
          const SizedBox(width: 8),
          Expanded(child: Text(message, maxLines: 2, overflow: TextOverflow.ellipsis)),
        ],
      ),
      backgroundColor: Colors.redAccent,
      behavior: SnackBarBehavior.floating, // ✅ floating over content
      margin: const EdgeInsets.only(top: 16, left: 16, right: 16),
      duration: const Duration(seconds: 3),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}