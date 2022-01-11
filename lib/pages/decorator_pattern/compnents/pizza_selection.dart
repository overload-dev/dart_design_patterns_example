import 'package:flutter/material.dart';

const _labels = ['Pizza Margherita', 'Pizza Pepperoni', 'Custom'];

class PizzaSelection extends StatelessWidget {
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const PizzaSelection({
    Key? key,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < _labels.length; i++)
          RadioListTile(
            title: Text(_labels[i]),
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
