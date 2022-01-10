import 'package:dart_design_patterns_example/pages/memento_pattern/commands/imemento.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/models/shape.dart';

import 'memento.dart';

class Originator {
  late Shape state;

  Originator() {
    state = Shape.initial();
  }

  IMemento createMemento() {
    return Memento(state);
  }

  void restore(IMemento memento) {
    state = memento.getState();
  }
}
