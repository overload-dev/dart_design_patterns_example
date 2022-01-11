import 'package:dart_design_patterns_example/components/patform_scaffold.dart';
import 'package:flutter/cupertino.dart';

class ProjectCupertinoScaffold implements PlatformScaffold {
  @override
  Widget render({required BuildContext context, required Widget appbar, required Widget child}) {
    return CupertinoPageScaffold(
      navigationBar: appbar as ObstructingPreferredSizeWidget,
      child: child,
    );
  }
}
