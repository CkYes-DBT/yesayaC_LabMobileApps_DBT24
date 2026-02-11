import 'package:flutter/material.dart';

class AppTopBar extends StatelessWidget implements PreferredSizeWidget {
  const AppTopBar({super.key, required this.title, this.onAddTap, this.onHeartTap});

  final String title;
  final VoidCallback? onAddTap;
  final VoidCallback? onHeartTap;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: const Color(0xFF000000),
      elevation: 0,
      leadingWidth: 60,
      leading: IconButton(
        icon: const Icon(Icons.add, size: 30),
        onPressed: onAddTap,
      ),
      centerTitle: true,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w700,
          letterSpacing: 0.2,
        ),
      ),
      actions: [
        IconButton(
          icon: const Icon(Icons.favorite_border, size: 26),
          onPressed: onHeartTap,
        ),
      ],
    );
  }
}
