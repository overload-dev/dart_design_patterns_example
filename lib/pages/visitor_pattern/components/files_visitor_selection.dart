import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:flutter/material.dart';

class FilesVisitorSelection extends StatelessWidget {
  final List<IVisitor> visitorsList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const FilesVisitorSelection({Key? key,
    required this.visitorsList,
    required this.selectedIndex,
    required this.onChanged,
  }): super(key :key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < visitorsList.length; i++)
          RadioListTile(
            title: Text(visitorsList[i].getTitle()),
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