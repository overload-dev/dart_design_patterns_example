import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builder_base.dart';

class BurgerMenuItem {
  final String label;
  final BurgerBuilderBase burgerBuilder;

  const BurgerMenuItem({
    required this.label,
    required this.burgerBuilder,
  });
}