import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/components/factory_selection.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/cupertino_widgets_factory.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iactivity_indicator.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/islider.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iswitch.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iwidgets_factory.dart';
import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/material_widgets_factory.dart';
import 'package:flutter/material.dart';

class AbstractFactoryPatternScreen extends StatefulWidget {
  static String routeName = '/abstract_factory_pattern_screen';

  const AbstractFactoryPatternScreen({Key? key}) : super(key: key);

  @override
  _AbstractFactoryPatternScreenState createState() =>
      _AbstractFactoryPatternScreenState();
}

class _AbstractFactoryPatternScreenState
    extends State<AbstractFactoryPatternScreen> {
  final List<IWidgetsFactory> widgetsFactoryList = [
    MaterialWidgetFactory(),
    CupertinoWidgetsFactory(),
  ];

  int _selectedFactoryIndex = 0;

  late IActivityIndicator _activityIndicator;
  late ISlider _slider;
  double _sliderValue = 50.0;

  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  late ISwitch _switch;
  bool _switchValue = false;

  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();

    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator =
        widgetsFactoryList[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetsFactoryList[_selectedFactoryIndex].createSlider();
    _switch = widgetsFactoryList[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int? index) {
    setState(() {
      _selectedFactoryIndex = index!;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Abstract Factory Pattern Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              FactorySelection(
                widgetsFactoryList: widgetsFactoryList,
                selectedIndex: _selectedFactoryIndex,
                onChanged: _setSelectedFactoryIndex,
              ),
              const SizedBox(height: 25.0),
              Text(
                'widgets showcase',
                style: Theme.of(context).textTheme.headline6,
              ),
              const SizedBox(height: 35.0),
              Text(
                'Process indicator',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 25.0),
              _activityIndicator.render(),
              const SizedBox(height: 35.0),
              Text(
                'Slider ($_sliderValueString%)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 25.0),
              _slider.render(_sliderValue, _setSliderValue),
              const SizedBox(height: 35.0),
              Text(
                'Switch ($_switchValueString)',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const SizedBox(height: 25.0),
              _switch.render(_switchValue, _setSwitchValue),
            ],
          ),
        ),
      ),
    );
  }
}
