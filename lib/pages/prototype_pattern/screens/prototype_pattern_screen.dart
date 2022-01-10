import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/prototypes/circle.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/prototypes/rectangle.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/prototypes/shape.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/shape_column.dart';
import 'package:flutter/material.dart';

class PrototypePatternScreen extends StatefulWidget {
  static String routeName = '/prototype_pattern_screen';

  const PrototypePatternScreen({Key? key}) : super(key: key);

  @override
  _PrototypePatternScreenState createState() => _PrototypePatternScreenState();
}

class _PrototypePatternScreenState extends State<PrototypePatternScreen> {
  final Shape _circle = Circle.initial();
  final Shape _rectangle = Rectangle.initial();

  Shape? _circleClone;
  Shape? _rectangleClone;

  void _randomiseCircleProperties() {
    setState(() {
      _circle.randomiseProperties();
    });
  }

  void _cloneCircle() {
    setState(() {
      _circleClone = _circle.clone();
    });
  }

  void _randomiseRectangleProperties() {
    setState(() {
      _rectangle.randomiseProperties();
    });
  }

  void _cloneRectangle() {
    setState(() {
      _rectangleClone = _rectangle.clone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Prototype Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              ShapeColumn(
                shape: _circle,
                shapeClone: _circleClone,
                onRandomisePropertiesPressed: _randomiseCircleProperties,
                onClonePressed: _cloneCircle,
              ),
              const Divider(),
              ShapeColumn(
                shape: _rectangle,
                shapeClone: _rectangleClone,
                onRandomisePropertiesPressed: _randomiseRectangleProperties,
                onClonePressed: _cloneRectangle,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
