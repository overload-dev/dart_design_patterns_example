import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:flutter/material.dart';

class Square implements IPositionedShape {
  final Color color;
  final double width;

  Square({
    required this.color,
    required this.width,
  });

  double get height => width;

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: height,
        width: width,
        color: color,
      ),
    );
  }
}
