import 'package:dart_design_patterns_example/components/iapp_bar.dart';
import 'package:flutter/material.dart';

class AndroidAppBar implements IAppBar {
  @override
  Widget render({required BuildContext context, required Widget title}) {
    return AppBar(
      title: title,
    );
  }
}
