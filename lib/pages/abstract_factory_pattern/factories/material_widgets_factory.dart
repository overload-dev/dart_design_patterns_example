import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/components/android_activity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/components/android_slider.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iactivity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iwidgets_factory.dart';

import '../components/android_switch.dart';
import 'islider.dart';
import 'iswitch.dart';

class MaterialWidgetFactory implements IWidgetsFactory {
  @override
  String getTitle() {
    return 'Android widgets';
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return AndroidActivityIndicator();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }
}
