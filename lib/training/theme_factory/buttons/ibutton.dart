import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

abstract class IButton {
  String getTitle();

  Widget build({
    required BuildContext context,
    required Widget child,
    Color materialColor = Colors.black,
    Color materialTextColor = Colors.white,
    required VoidCallback onPressed,
  });
}

class AndroidButton implements IButton {
  @override
  String getTitle() {
    return 'Custom Button';
  }

  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    Color materialColor = Colors.black,
    Color materialTextColor = Colors.white,
    required VoidCallback onPressed,
  }) {
    return MaterialButton(
      onPressed: onPressed,
      child: child,
      color: materialColor,
      textColor: materialTextColor,
      disabledColor: Colors.grey,
      disabledTextColor: Colors.white70,
    );
  }
}

class IOSButton implements IButton {
  @override
  Widget build({
    required BuildContext context,
    required Widget child,
    Color materialColor = Colors.black,
    Color materialTextColor = Colors.white,
    required VoidCallback onPressed,
  }) {
    return CupertinoButton(
      color: Colors.grey,
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  String getTitle() {
    return 'IOS Button';
  }
}
