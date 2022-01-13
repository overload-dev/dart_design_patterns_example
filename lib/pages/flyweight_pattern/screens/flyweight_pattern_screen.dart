import 'dart:math';

import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/components/positioned_shape_wrapper.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/factories/shape_factory.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/factories/shape_flyweight_factory.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shape_type.dart';
import 'package:dart_design_patterns_example/pages/flyweight_pattern/shapes/ipositioned_shape.dart';
import 'package:flutter/material.dart';

class FlyweightPatternScreen extends StatefulWidget {
  static String routeName = '/flyweight_pattern_screen';

  const FlyweightPatternScreen({Key? key}) : super(key: key);

  @override
  _FlyweightPatternScreenState createState() => _FlyweightPatternScreenState();
}

class _FlyweightPatternScreenState extends State<FlyweightPatternScreen> {
  static const int SHAPES_COUNT = 1000;

  final ShapeFactory shapeFactory = ShapeFactory();

  late ShapeFlyweightFactory _shapeFlyweightFactory;
  late List<IPositionedShape> _shapesList;

  int _shapeInstancesCount = 0;

  bool _useFlyweightFactory = false;

  @override
  void initState() {
    super.initState();

    _shapeFlyweightFactory = ShapeFlyweightFactory(shapeFactory: shapeFactory);
    _buildShapesList();
  }

  void _buildShapesList() {
    var shapeInstancesCount = 0;

    _shapesList = List<IPositionedShape>.generate(SHAPES_COUNT, (index) {
      var shapeType = _getRandomShapeType();
      var shape = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShape(shapeType)
          : shapeFactory.createShape(shapeType);

      shapeInstancesCount++;
      return shape;
    });

    setState(() {
      _shapeInstancesCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShapeInstancesCount()
          : shapeInstancesCount;
    });
  }

  ShapeType _getRandomShapeType() {
    var values = ShapeType.values;
    return values[Random().nextInt(values.length)];
  }

  void _toggleUseFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });

    _buildShapesList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Flyweight Pattern Example',
        ),
      ),
      body: Stack(
        children: [
          for (var shape in _shapesList)
            PositionedShapeWrapper(
              shape: shape,
            ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SwitchListTile.adaptive(
                  title: const Text(
                    'Use flyweight factory',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  activeColor: Colors.black,
                  value: _useFlyweightFactory,
                  onChanged: _toggleUseFlyweightFactory)
            ],
          ),
          Center(
            child: Text(
              'Shape instances $_shapeInstancesCount',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ],
      ),
    );
  }
}
