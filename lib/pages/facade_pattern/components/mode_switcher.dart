import 'package:flutter/material.dart';

class ModeSwitcher extends StatelessWidget {
  final String title;
  final bool activated;
  final ValueSetter<bool>? onChanged;

  const ModeSwitcher({
    Key? key,
    required this.title,
    required this.activated,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: Text(title),
      value: activated,
      onChanged: onChanged,
      activeColor: Colors.black,
    );
  }
}
