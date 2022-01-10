import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/pages/prototype_pattern/prototypes/shape.dart';
import 'package:flutter/material.dart';

class ShapeColumn extends StatelessWidget {
  final Shape shape;
  final Shape? shapeClone;
  final VoidCallback onRandomisePropertiesPressed;
  final VoidCallback onClonePressed;

  const ShapeColumn({
    Key? key,
    required this.shape,
    required this.shapeClone,
    required this.onRandomisePropertiesPressed,
    required this.onClonePressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: _ShapeWidthLabel(
                label: 'Original shape',
                child: shape.render(),
              ),
            ),
            Expanded(
              child: _ShapeWidthLabel(
                label: 'Cloned shape',
                child: shapeClone == null
                    ? const SizedBox(
                        height: 120,
                        width: 120.0,
                        child: Placeholder(),
                      )
                    : shapeClone!.render(),
              ),
            ),
          ],
        ),
        PlatformButton(
          child: const Text('Randomise properties'),
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: onRandomisePropertiesPressed,
        ),
        PlatformButton(
          child: const Text('Clone'),
          materialColor: Colors.black,
          materialTextColor: Colors.white,
          onPressed: onClonePressed,
        ),
      ],
    );
  }
}

class _ShapeWidthLabel extends StatelessWidget {
  final String label;
  final Widget child;

  const _ShapeWidthLabel({
    Key? key,
    required this.label,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(label),
        const SizedBox(height: 25.0),
        child,
      ],
    );
  }
}
