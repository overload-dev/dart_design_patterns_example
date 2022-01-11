import 'package:dart_design_patterns_example/components/patform_scaffold.dart';
import 'package:flutter/material.dart';

class ProjectMaterialScaffold implements PlatformScaffold {
  @override
  Widget render({
    required BuildContext context,
    required Widget appbar,
    required Widget child,
  }) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: appbar,
      ),
      body: child,
    );
  }
}
