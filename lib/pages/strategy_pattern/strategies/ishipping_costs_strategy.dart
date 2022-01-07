import 'package:dart_design_patterns_example/pages/strategy_pattern/models/order.dart';

abstract class IShippingCostsStrategy {
  late String label;

  double calculate(Order order);
}
