import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:flutter/material.dart';

class Circle implements IPositionedShape {
  final Color color;
  final double diameter;

  Circle({
    required this.color,
    required this.diameter,
  });

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle,
        ),
      ),
    );
  }
}
