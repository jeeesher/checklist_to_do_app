import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final IconData actionIcon;
  final String tooltip;
  final VoidCallback onActionPressed;

  const CustomAppBar({
    super.key,
    required this.title,
    required this.actionIcon,
    required this.tooltip,
    required this.onActionPressed,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: const Color(0xFF4A3780),
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Colors.white,
        ),
      ),
      actions: [
        Container(
          margin: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.white,
          ),
          child: IconButton(
            icon: Icon(
              actionIcon,
              color: const Color(0xFF4A3780),
              size: 22,
            ),
            onPressed: onActionPressed,
            tooltip: tooltip,
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
