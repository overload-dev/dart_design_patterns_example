import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iscaffold.dart';
import 'package:flutter/cupertino.dart';

class IOSScaffold implements IScaffold {
  @override
  String getTitle() {
    return 'IOS - Scaffold';
  }

  @override
  Widget build({
    required BuildContext context,
    required Widget appBar,
    required Widget child,
  }) {
    return CupertinoPageScaffold(
      navigationBar: appBar as ObstructingPreferredSizeWidget,
      child: child,
    );
  }
}
