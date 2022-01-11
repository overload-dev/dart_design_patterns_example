import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza_topping_data.dart';
import 'package:flutter/material.dart';

class CustomPizzaSelection extends StatelessWidget {
  final Map<int, PizzaToppingData> pizzaToppingsDataMap;
  final Function(int, bool?) onSelected;

  const CustomPizzaSelection({
    Key? key,
    required this.pizzaToppingsDataMap,
    required this.onSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 15.0,
      children: <Widget>[
        for (var i = 0; i < pizzaToppingsDataMap.length; i++)
          i == 0
              ? ChoiceChip(
            label: const Text(
              'Pizza Base',
              style: TextStyle(color: Colors.white),
            ),
            selected: true,
            selectedColor: Colors.black,
            onSelected: (_) {},
          )
              : ChoiceChip(
            label: Text(
              pizzaToppingsDataMap[i]!.label,
              style: TextStyle(
                color: pizzaToppingsDataMap[i]!.selected
                    ? Colors.white
                    : Colors.black,
              ),
            ),
            selected: pizzaToppingsDataMap[i]!.selected,
            selectedColor: Colors.black,
            onSelected: (bool? selected) => onSelected(i, selected),
          ),
      ],
    );
  }
}
