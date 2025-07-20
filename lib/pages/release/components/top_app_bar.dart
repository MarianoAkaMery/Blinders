import 'package:flutter/material.dart';

class TopAppBarRelease extends StatelessWidget implements PreferredSizeWidget {
  const TopAppBarRelease({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text(
        'Releases',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: false,
      toolbarHeight: 50,
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
