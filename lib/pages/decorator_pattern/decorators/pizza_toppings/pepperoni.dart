import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza_decorator.dart';

class Pepperoni extends PizzaDecorator {
  Pepperoni(Pizza pizza) : super(pizza) {
    description = 'Pepperoni';
  }

  @override
  String getDescription() {
    return '${pizza.getDescription()}\n- $description';
  }

  @override
  double getPrice() {
    return pizza.getPrice() + 1.5;
  }
}
