import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class PlatformButton extends StatelessWidget {
  final Widget child;

  final Color materialColor;
  final Color materialTextColor;
  final VoidCallback? onPressed;

  const PlatformButton({
    Key? key,
    required this.child,
    required this.materialColor,
    required this.materialTextColor,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: _buildButton(),
    );
  }

  _buildButton() {
    if (kIsWeb || Platform.isAndroid || Platform.isWindows) {
      return MaterialButton(
        color: materialColor,
        textColor: materialTextColor,
        disabledColor: Colors.grey,
        disabledTextColor: Colors.white,
        onPressed: onPressed,
        child: child,
      );
    } else {
      return CupertinoButton(
        color: Colors.grey,
        onPressed: onPressed,
        child: child,
      );
    }
  }
}
