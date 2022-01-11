import 'package:dart_design_patterns_example/pages/bridge_pattern/istorage.dart';
import 'package:flutter/material.dart';

class StorageSelection extends StatelessWidget {
  final List<IStorage> storages;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const StorageSelection({
    Key? key,
    required this.storages,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < storages.length; i++)
          RadioListTile(
            title: Text(storages[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}