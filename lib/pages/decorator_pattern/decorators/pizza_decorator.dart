import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza.dart';

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  String getDescription() {
    return pizza.description;
  }

  @override
  double getPrice() {
    return pizza.getPrice();
  }
}
