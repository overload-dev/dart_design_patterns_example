import 'package:dart_design_patterns_example/pages/flyweight_pattern/shape_type.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/circle.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/square.dart';
import 'package:flutter/material.dart';

class ShapeFactory {
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return Circle(
          color: Colors.red.withOpacity(0.2),
          diameter: 10.0,
        );
      case ShapeType.Square:
        return Square(
          color: Colors.blue.withOpacity(0.2),
          width: 10.0,
        );
      default:
        throw Exception("Shape type '$shapeType' is not supported.");
    }
  }
}
