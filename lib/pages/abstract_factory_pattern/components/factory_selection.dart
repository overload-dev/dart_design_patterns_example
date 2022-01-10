import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iwidgets_factory.dart';
import 'package:flutter/material.dart';

class FactorySelection extends StatelessWidget {
  final List<IWidgetsFactory> widgetsFactoryList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const FactorySelection({
    Key? key,
    required this.widgetsFactoryList,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for(int i = 0 ; i < widgetsFactoryList.length ; i ++ )
          RadioListTile(
              title: Text(widgetsFactoryList[i].getTitle()),
              value: i,
              groupValue: selectedIndex,
              onChanged: onChanged,
          )
      ],
    );
  }
}
