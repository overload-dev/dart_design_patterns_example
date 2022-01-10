import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/screens/abstract_factory_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/screens/adapter_patern_screen.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/screens/command_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/composite_pattern/screen/composite_screen.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/screens/facade_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/factory_method_pattern/screens/factory_method_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/screens/interpreter_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/screens/iterator_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/screens/memento_screen.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/screens/prototype_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/screens/proxy_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/screens/state_pattern_screen.dart';
import 'package:dart_design_patterns_example/pages/strategy_pattern/screens/strategy_screen.dart';
import 'package:dart_design_patterns_example/pages/template_method_pattern/screens/template_pattern_screen.dart';
import 'package:flutter/widgets.dart';


final Map<String, WidgetBuilder> routes = {
  AdapterPatternScreen.routeName: (context) => const AdapterPatternScreen(),
  TemplateMethodPatternScreen.routeName: (context) => const TemplateMethodPatternScreen(),
  CompositePatternScreen.routeName: (context) => const CompositePatternScreen(),
  StrategyPatternScreen.routeName: (context) => const StrategyPatternScreen(),
  StatePatternScreen.routeName: (context) => const StatePatternScreen(),
  FacadePatternScreen.routeName: (context) => const FacadePatternScreen(),
  InterpreterPatternScreen.routeName: (context) => const InterpreterPatternScreen(),
  IteratorPatternScreen.routeName: (context) => const IteratorPatternScreen(),
  FactoryMethodPatternScreen.routeName: (context) => const FactoryMethodPatternScreen(),
  AbstractFactoryPatternScreen.routeName: (context) => const AbstractFactoryPatternScreen(),
  CommandPatternScreen.routeName: (context) => const CommandPatternScreen(),
  MementoPatternScreen.routeName: (context) => const MementoPatternScreen(),
  PrototypePatternScreen.routeName: (context) => const PrototypePatternScreen(),
  ProxyPatternScreen.routeName: (context) => const ProxyPatternScreen(),
};
