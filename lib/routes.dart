import 'package:dart_design_patterns_example/pages/adapter_pattern/screens/adapter_patern_screen.dart';
import 'package:dart_design_patterns_example/pages/composite/screen/composite_screen.dart';
import 'package:dart_design_patterns_example/pages/strategy/screens/strategy_screen.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/screens/template_pattern_screen.dart';
import 'package:flutter/material.dart';

final Map<String, WidgetBuilder> routes = {
  AdapterPatternScreen.routeName: (context) => const AdapterPatternScreen(),
  TemplatePatternScreen.routeName: (context) => const TemplatePatternScreen(),
  CompositeScreen.routeName: (context) => const CompositeScreen(),
  StrategyScreen.routeName: (context) => const StrategyScreen(),
};