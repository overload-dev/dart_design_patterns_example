import 'package:flutter/widgets.dart';

abstract class PlatformScaffold {
  Widget render({
    required BuildContext context,
    required Widget appbar,
    required Widget child,
  });
}
