import 'package:flutter/material.dart';

class ProjectAppBar extends StatelessWidget {
  final String title;
  const ProjectAppBar({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: AppBar(
        centerTitle: true,
        title: Text(title),
      ),
    );
  }
}
