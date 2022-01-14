import 'package:flutter/widgets.dart';

abstract class IScaffold {
  String getTitle();

  Widget build({
    required BuildContext context,
    required Widget appBar,
    required Widget child,
  });
}
