import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iactivity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/components/ios_activity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/components/ios_slider.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iswitch.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iwidgets_factory.dart';

import '../components/ios_switch.dart';
import 'islider.dart';

class CupertinoWidgetsFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'iOS widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }
}
