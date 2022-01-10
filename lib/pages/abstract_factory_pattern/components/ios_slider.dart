import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/islider.dart';
import 'package:flutter/cupertino.dart';

class IosSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return CupertinoSlider(
      min: 0.0,
      max: 100.0,
      value: value,
      onChanged: onChanged,
    );
  }
}
