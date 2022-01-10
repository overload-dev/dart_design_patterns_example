import 'package:dart_design_patterns_example/pages/memento_pattern/commands/imemento.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/models/shape.dart';

class Memento implements IMemento {
  late Shape _state;

  Memento(Shape shape) {
    _state = Shape.copy(shape);
  }

  @override
  Shape getState() {
    return _state;
  }
}
