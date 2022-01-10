import 'package:flutter/cupertino.dart';

abstract class ISlider {
  Widget render(double value, ValueSetter<double> onChanged);
}
