import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_collection.dart';
import 'package:flutter/material.dart';

class TreeCollectionSelection extends StatelessWidget {
  final List<ITreeCollection> treeCollections;
  final int selectedIndex;
  final ValueSetter<int?>? onChanged;

  const TreeCollectionSelection({
    Key? key,
    required this.treeCollections,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < treeCollections.length; i++)
          RadioListTile(
            title: Text(treeCollections[i].getTitle()),
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
