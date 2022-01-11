import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

abstract class IAppBar {
  Widget render({
    required BuildContext context,
    required Widget title,
  });
}
