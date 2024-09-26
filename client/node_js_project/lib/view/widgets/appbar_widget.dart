import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Node JS"),
      centerTitle: true,
      elevation: 3,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
