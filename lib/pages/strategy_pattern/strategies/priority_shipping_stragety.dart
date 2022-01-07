import 'ishipping_costs_strategy.dart';

import 'package:dart_design_patterns_example/pages/strategy_pattern/models/order.dart';

class PriorityShippingStrategy implements IShippingCostsStrategy {
  @override
  String label = 'Priority shipping';

  @override
  double calculate(Order order) {
    return 9.99;
  }
}
