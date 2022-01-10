import 'package:dart_design_patterns_example/components/project_app_bar.dart';
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
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> routes = [
    {
      'title': '01.\nAdapter Pattern Example',
      'routeName': AdapterPatternScreen.routeName,
    },
    {
      'title': '02\nTemplate Method Pattern Example',
      'routeName': TemplateMethodPatternScreen.routeName,
    },
    {
      'title': '03\nComposite Pattern Example',
      'routeName': CompositePatternScreen.routeName,
    },
    {
      'title': '04\nStrategy Pattern Example',
      'routeName': StrategyPatternScreen.routeName,
    },
    {
      'title': '05\nState Pattern Example',
      'routeName': StatePatternScreen.routeName,
    },
    {
      'title': '06\nFacade Pattern Example',
      'routeName': FacadePatternScreen.routeName,
    },
    {
      'title': ' 07\nInterpreter Pattern Example',
      'routeName': InterpreterPatternScreen.routeName,
    },
    {
      'title': ' 08\nIterator Pattern Example',
      'routeName': IteratorPatternScreen.routeName,
    },
    {
      'title': ' 09\nFactory Method Pattern Example',
      'routeName': FactoryMethodPatternScreen.routeName,
    },
    {
      'title': ' 10\nAbstract Factory Pattern Example',
      'routeName': AbstractFactoryPatternScreen.routeName,
    },
    {
      'title': ' 11\nCommand Pattern Example',
      'routeName': CommandPatternScreen.routeName,
    },
    {
      'title': ' 12\nMemento Pattern Example',
      'routeName': MementoPatternScreen.routeName,
    },
    {
      'title': ' 13\nPrototype Pattern Example',
      'routeName': PrototypePatternScreen.routeName,
    },
    {
      'title': ' 14\nProxy Pattern Example',
      'routeName': ProxyPatternScreen.routeName,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Main',
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(
                context, routes[index]['routeName'] as String),
            child: _buildItemCard(
              context: context,
              title: routes[index]['title'] as String,
            ),
          );
        },
      ),
    );
  }

  _buildItemCard({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          height: 100.0,
          color: Colors.black,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
