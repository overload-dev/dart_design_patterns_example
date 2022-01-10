import 'package:dart_design_patterns_example/pages/command_pattern/commands/command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/models/shape.dart';
import 'package:faker/faker.dart';

class ChangeHeightCommand implements Command {
  Shape shape;
  late double previousHeight;

  ChangeHeightCommand(this.shape) {
    previousHeight = shape.height;
  }

  @override
  void execute() {
    shape.height = random.integer(150, min: 50).toDouble();
  }

  @override
  String getTitle() {
    return 'Change Height';
  }

  @override
  void undo() {
    shape.height = previousHeight;
  }
}
