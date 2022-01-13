import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/factories/shape_factory.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shape_type.dart';

class ShapeFlyweightFactory {
  final ShapeFactory shapeFactory;
  final Map<ShapeType, IPositionedShape> shapesMap = {};

  ShapeFlyweightFactory({
    required this.shapeFactory,
  });

  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }

    return shapesMap[shapeType]!;
  }

  int getShapeInstancesCount() {
    return shapesMap.length;
  }
}
