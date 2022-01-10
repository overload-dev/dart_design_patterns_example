import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iactivity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/islider.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iswitch.dart';

abstract class IWidgetsFactory {
  String getTitle();

  IActivityIndicator createActivityIndicator();

  ISlider createSlider();

  ISwitch createSwitch();
}
