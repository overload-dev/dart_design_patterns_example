import 'package:dart_design_patterns_example/pages/builder_pattern/ingredient.dart';

class Burger {
  final List<Ingredient> _ingredients = [];
  late double _price;

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  String getFormattedIngredients() {
    return _ingredients.map((x) => x.getName()).join(', ');
  }

  String getFormattedAllergens() {
    Set<String> allergens = <String>{};

    for (var x in _ingredients) {
      allergens.addAll(x.getAllergens());
    }

    return allergens.join(', ');
  }

  String getFormattedPrice() {
    return '\$${_price.toStringAsFixed(2)}';
  }

  void setPrice(double price) {
    _price = price;
  }
}
