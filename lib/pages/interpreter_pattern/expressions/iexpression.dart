import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/expression_context.dart';

abstract class IExpression {
  int interpret(ExpressionContext context);
}