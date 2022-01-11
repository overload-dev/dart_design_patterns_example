import 'package:dart_design_patterns_example/pages/builder_pattern/ingredient.dart';

class Cheese extends Ingredient {
  Cheese() {
    name = 'Cheese';
    allergens = ['Milk', 'Soy'];
  }
}
