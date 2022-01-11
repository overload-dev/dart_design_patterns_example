import 'package:dart_design_patterns_example/pages/builder_pattern/burger.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/components/burger_information_label.dart';
import 'package:flutter/material.dart';

class BurgerInformationColumn extends StatelessWidget {
  final Burger burger;

  const BurgerInformationColumn({
    Key? key,
    required this.burger,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        const BurgerInformationLabel('Price'),
        Text(burger.getFormattedPrice()),
        const SizedBox(height: 20.0),
        const BurgerInformationLabel('Ingredients'),
        Text(
          burger.getFormattedIngredients(),
          textAlign: TextAlign.justify,
        ),
        const SizedBox(height: 20.0),
        const BurgerInformationLabel('Allergens'),
        Text(
          burger.getFormattedAllergens(),
          textAlign: TextAlign.justify,
        ),
      ],
    );
  }
}
