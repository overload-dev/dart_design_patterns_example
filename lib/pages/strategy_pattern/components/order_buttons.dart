import 'package:dart_design_patterns_example/pages/strategy_pattern/components/order_button.dart';
import 'package:flutter/material.dart';

class OrderButtons extends StatelessWidget {
  final VoidCallback onAdd;
  final VoidCallback onClear;

  const OrderButtons({
    Key? key,
    required this.onAdd,
    required this.onClear,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: <Widget>[
        OrderButton(
          iconData: Icons.add,
          title: 'Add random item',
          onPressed: onAdd,
        ),
        OrderButton(
          iconData: Icons.clear,
          title: 'Clear',
          onPressed: onClear,
        ),
      ],
    );
  }
}
