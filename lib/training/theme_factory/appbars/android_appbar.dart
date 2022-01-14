import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iappbar.dart';
import 'package:flutter/material.dart';

class AndroidAppBar implements IAppBar {
  @override
  String getTitle() {
    return 'Android - App Bar';
  }

  @override
  Widget build({
    required BuildContext context,
    required Text title,
    required Widget? leading,
    required List<Widget> actions,
  }) {
    return AppBar(
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}
