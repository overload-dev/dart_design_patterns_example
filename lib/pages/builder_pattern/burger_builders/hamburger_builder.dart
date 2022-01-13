import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builder_base.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/bun/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/grill_seasoning.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/patties/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/sauces/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/vegetables/index.dart';

class HamburgerBuilder extends BurgerBuilderBase {
  HamburgerBuilder() {
    price = 1.0;
  }

  @override
  void addBuns() {
    burger.addIngredient(RegularBun());
  }

  @override
  void addCheese() {
    // Not needed
  }

  @override
  void addPatties() {
    burger.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    burger.addIngredient(Ketchup());
    burger.addIngredient(Mustard());
  }

  @override
  void addSeasoning() {
    burger.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    burger.addIngredient(Onions());
    burger.addIngredient(PickleSlices());
  }
}
