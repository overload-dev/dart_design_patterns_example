import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/components/expression_section.dart';
import 'package:flutter/material.dart';

class InterpreterPatternScreen extends StatefulWidget {
  static String routeName = '/interpreter_pattern_screen';

  const InterpreterPatternScreen({Key? key}) : super(key: key);

  @override
  State<InterpreterPatternScreen> createState() =>
      _InterpreterPatternScreenState();
}

class _InterpreterPatternScreenState extends State<InterpreterPatternScreen> {
  final List<String> _postfixExpressions = [
    '20 3 5 * - 2 3 * +',
    '1 1 1 1 1 + + + * 2 -',
    '123 12 1 - - 12 9 * -',
    '9 8 7 6 5 4 3 2 1 + - + - + - + -',
    '1 1 2 * + 3 - 4 +',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Interpreter Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for(var postfixExpression in _postfixExpressions)
                ExpressionSection(postfixExpression),
            ],
          ),
        ),
      ),
    );
  }
}
