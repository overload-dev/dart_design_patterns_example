import 'package:dart_design_patterns_example/pages/builder_pattern/ingredient.dart';

class BigMacSauce extends Ingredient {
  BigMacSauce() {
    name = 'Big Mac Sauce';
    allergens = ['Egg', 'Soy', 'Wheat'];
  }
}
