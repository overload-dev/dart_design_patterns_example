import 'package:dart_design_patterns_example/pages/builder_pattern/burger.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builder_base.dart';

class BurgerMaker {
  BurgerBuilderBase burgerBuilder;

  BurgerMaker(this.burgerBuilder);

  void changeBurgerBuilder(BurgerBuilderBase burgerBuilder) {
    this.burgerBuilder = burgerBuilder;
  }

  Burger getBurger() {
    return burgerBuilder.getBurger();
  }

  void prepareBurger() {
    burgerBuilder.createBurger();
    burgerBuilder.setBurgerPrice();

    burgerBuilder.addBuns();
    burgerBuilder.addCheese();
    burgerBuilder.addPatties();
    burgerBuilder.addSauces();
    burgerBuilder.addSeasoning();
    burgerBuilder.addVegetables();
  }
}
