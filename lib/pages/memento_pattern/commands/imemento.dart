import 'package:dart_design_patterns_example/pages/memento_pattern/models/shape.dart';

abstract class IMemento {
  Shape getState();
}