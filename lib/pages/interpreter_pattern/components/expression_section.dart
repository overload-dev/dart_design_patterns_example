import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/expression_context.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/expression_helpers.dart';
import 'package:flutter/material.dart';

class ExpressionSection extends StatefulWidget {
  final String postfixExpression;

  const ExpressionSection(this.postfixExpression, {Key? key}) : super(key: key);

  @override
  _ExpressionSectionState createState() => _ExpressionSectionState();
}

class _ExpressionSectionState extends State<ExpressionSection> {
  final ExpressionContext _expressionContext = ExpressionContext();
  final List<String> _solutionSteps = [];

  void _solvePrefixExpression() {
    List<String> solutionSteps = [];

    var expression =
        ExpressionHelpers.buildExpressionTree(widget.postfixExpression);
    var result = expression.interpret(_expressionContext);
    _solutionSteps
      ..addAll(_expressionContext.getSolutionSteps())
      ..add('Result: $result');

    setState(() {
      _solutionSteps.addAll(solutionSteps);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.postfixExpression,
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 25.0),
        AnimatedCrossFade(
          duration: const Duration(milliseconds: 200),
          firstChild: PlatformButton(
            child: const  Text('Solve'),
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _solvePrefixExpression,
          ),
          secondChild: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              for (var solutionStep in _solutionSteps)
                Text(
                  solutionStep,
                  style: Theme.of(context).textTheme.subtitle2,
                )
            ],
          ),
          crossFadeState: _solutionSteps.isEmpty
              ? CrossFadeState.showFirst
              : CrossFadeState.showSecond,
        ),
        const SizedBox(height: 35.0),
      ],
    );
  }
}
