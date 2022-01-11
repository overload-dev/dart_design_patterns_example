import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza.dart';
import 'package:flutter/material.dart';

class PizzaInformation extends StatelessWidget {
  final Pizza pizza;

  const PizzaInformation({Key? key, required this.pizza}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Text(
          'Pizza details:',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 25.0),
        Text(
          pizza.getDescription(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20.0),
        Text('Price: \$${pizza.getPrice().toStringAsFixed(2)}'),
      ],
    );
  }
}
