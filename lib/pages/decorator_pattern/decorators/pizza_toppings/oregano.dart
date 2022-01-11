import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza_decorator.dart';

class Oregano extends PizzaDecorator {
  Oregano(Pizza pizza) : super(pizza) {
    description = 'Oregano';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 0.2;
  }
}
