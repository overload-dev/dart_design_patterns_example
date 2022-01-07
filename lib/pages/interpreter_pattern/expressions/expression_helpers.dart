import 'dart:collection';

import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/add.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/iexpression.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/multiply.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/number.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/subtract.dart';

class ExpressionHelpers {
  static final List<String> _operators = ['+', '-', '*'];

  static IExpression buildExpressionTree(String postfixExpression) {
    var expressionStack = ListQueue<IExpression>();

    for (var symbol in postfixExpression.split(' ')) {
      if (_isOperator(symbol)) {
        var rightExpression = expressionStack.removeLast();
        var leftExpression = expressionStack.removeLast();
        var nonTerminalExpression =
            _getNonTerminalExpression(symbol, leftExpression, rightExpression);
        expressionStack.addLast(nonTerminalExpression);
      } else {
        var numberExpression = Number(int.parse(symbol));

        expressionStack.addLast(numberExpression);
      }
    }

    return expressionStack.single;
  }

  static bool _isOperator(String symbol) {
    return _operators.contains(symbol);
  }

  static IExpression _getNonTerminalExpression(
    String symbol,
    IExpression leftExpression,
    IExpression rightExpression,
  ) {
    IExpression expression;

    switch (symbol) {
      case '+':
        expression = Add(leftExpression, rightExpression);
        break;
      case '-':
        expression = Subtract(leftExpression, rightExpression);
        break;
      case '*':
        expression = Multiply(leftExpression, rightExpression);
        break;
      default:
        throw Exception('Expression is not defined');
    }

    return expression;
  }
}
