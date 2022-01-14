import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iscaffold.dart';
import 'package:flutter/material.dart';

class AndroidScaffold implements IScaffold {
  @override
  String getTitle() {
    return 'Android - Scaffold';
  }

  @override
  Widget build({
    required BuildContext context,
    required Widget appBar,
    required Widget child,
  }) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: appBar,
      ),
      body: child,
    );
  }
}
