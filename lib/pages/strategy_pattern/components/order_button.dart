import 'dart:io';

import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class OrderButton extends StatelessWidget {
  final IconData iconData;
  final String title;
  final VoidCallback onPressed;

  const OrderButton({
    Key? key,
    required this.iconData,
    required this.title,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final child = Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Icon(
          iconData,
          color: Colors.white,
        ),
        const SizedBox(width: 50),
        Text(title),
      ],
    );

    return PlatformButton(
      child: child,
      onPressed: onPressed,
      materialColor: Colors.black,
      materialTextColor: Colors.white,
    );
  }
}
