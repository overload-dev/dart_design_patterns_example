import 'package:dart_design_patterns_example/components/iapp_bar.dart';
import 'package:flutter/cupertino.dart';

class IOSAppBar implements IAppBar {
  @override
  Widget render({required BuildContext context, required Widget title}) {
    return CupertinoNavigationBar(
      middle: title,
    );
  }
}
