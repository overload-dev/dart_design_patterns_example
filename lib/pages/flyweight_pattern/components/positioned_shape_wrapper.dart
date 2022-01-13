import 'dart:math';

import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:flutter/material.dart';

class PositionedShapeWrapper extends StatelessWidget {
  final IPositionedShape shape;

  const PositionedShapeWrapper({
    Key? key,
    required this.shape,
  }) : super(key: key);

  double _getPosition(double max, double min) {
    final double randomPosition = Random().nextDouble() * max;
    return randomPosition > min ? randomPosition - min : randomPosition;
  }

  @override
  Widget build(BuildContext context) {
    final sizeHeight = MediaQuery.of(context).size.height;
    final sizeWidth = MediaQuery.of(context).size.width;

    return shape.render(
      _getPosition(sizeWidth, 16.0),
      _getPosition(sizeHeight, 192.0),
    );
  }
}
