import 'package:dart_design_patterns_example/pages/command_pattern/commands/command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/models/shape.dart';
import 'package:faker/faker.dart';

class ChangeWidthCommand implements Command {
  Shape shape;
  late double previousWidth;

  ChangeWidthCommand(this.shape) {
    previousWidth = shape.width;
  }

  @override
  void execute() {
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change Width';
  }

  @override
  void undo() {
    shape.width = previousWidth;
  }
}
