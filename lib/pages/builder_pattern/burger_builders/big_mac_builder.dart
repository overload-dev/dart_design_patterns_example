import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builder_base.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/bun/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/cheese.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/grill_seasoning.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/patties/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/sauces/index.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/ingredients/vegetables/index.dart';

class BigMacBuilder extends BurgerBuilderBase {
  BigMacBuilder() {
    price = 3.99;
  }

  @override
  void addBuns() {
    burger.addIngredient(BigMacBun());
  }

  @override
  void addCheese() {
    burger.addIngredient(Cheese());
  }

  @override
  void addPatties() {
    burger.addIngredient(BeefPatty());
  }

  @override
  void addSauces() {
    burger.addIngredient(BigMacSauce());
  }

  @override
  void addSeasoning() {
    burger.addIngredient(GrillSeasoning());
  }

  @override
  void addVegetables() {
    burger.addIngredient(Onions());
    burger.addIngredient(PickleSlices());
    burger.addIngredient(ShreddedLettuce());
  }
}
