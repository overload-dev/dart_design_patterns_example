import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/expression_context.dart';
import 'package:dart_design_patterns_example/pages/interpreter_pattern/expressions/iexpression.dart';

class Number implements IExpression {
  final int number;

  const Number(this.number);

  @override
  int interpret(ExpressionContext context) {
    return number;
  }
}
