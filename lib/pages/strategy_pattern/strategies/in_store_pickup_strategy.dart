import 'package:dart_design_patterns_example/pages/strategy_pattern/models/order.dart';

import 'ishipping_costs_strategy.dart';

class InStorePickupStrategy implements IShippingCostsStrategy {
  @override
  String label = 'In-Store pickup';

  @override
  double calculate(Order order) {
    return 0.0;
  }
}
