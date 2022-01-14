import 'package:flutter/widgets.dart';

abstract class IAppBar {
  String getTitle();

  Widget build({
    required BuildContext context,
    required Text title,
    required Widget? leading,
    required List<Widget> actions,
  });
}
