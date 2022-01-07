import 'package:flutter/material.dart';

class DeviceIcon extends StatelessWidget {
  final IconData iconData;
  final bool activated;

  const DeviceIcon({
    Key? key,
    required this.iconData,
    required this.activated,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Icon(
      iconData,
      color: activated ? Colors.blue : Colors.grey,
      size: 42.0,
    );
  }
}
