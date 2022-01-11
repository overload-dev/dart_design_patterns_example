import 'dart:io';

import 'package:dart_design_patterns_example/components/android_app_bar.dart';
import 'package:dart_design_patterns_example/components/iapp_bar.dart';
import 'package:dart_design_patterns_example/components/ios_app_bar.dart';
import 'package:dart_design_patterns_example/components/platform_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_cupertino_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_material_scaffold.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/compnents/custom_pizza_selection.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/compnents/pizza_information.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/compnents/pizza_selection.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza_menu.dart';
import 'package:dart_design_patterns_example/pages/decorator_pattern/decorators/pizza_topping_data.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class DecoratorPatternScreen extends StatefulWidget {
  static String routeName = '/decorator_pattern_screen';

  const DecoratorPatternScreen({Key? key}) : super(key: key);

  @override
  _DecoratorPatternScreenState createState() => _DecoratorPatternScreenState();
}

class _DecoratorPatternScreenState extends State<DecoratorPatternScreen> {
  final List<PlatformScaffold> scaffoldList = [
    ProjectMaterialScaffold(),
    ProjectCupertinoScaffold()
  ];

  final List<IAppBar> appbarList = [
    AndroidAppBar(),
    IOSAppBar(),
  ];

  late PlatformScaffold scaffold;
  late IAppBar appbar;

  int platformIndex =
      kIsWeb || Platform.isAndroid || Platform.isWindows ? 0 : 1;

  // ===========================================================================

  final PizzaMenu pizzaMenu = PizzaMenu();

  late Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  late Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      scaffold = scaffoldList[platformIndex];
      appbar = appbarList[platformIndex];
    });

    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
  }

  void _onSelectedIndexChanged(int? index) {
    _setSelectedIndex(index);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int? index) {
    setState(() {
      _selectedIndex = index!;
    });
  }

  void _onCustomPizzaChipSelected(int index, bool? selected) {
    _setChipSelected(index, selected!);
    _setSelectedPizza(_selectedIndex);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap[index]!.setSelected(selected);
    });
  }

  void _setSelectedPizza(int? index) {
    setState(() {
      _pizza = pizzaMenu.getPizza(index!, _pizzaToppingsDataMap);
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffold.render(
      context: context,
      appbar: appbar.render(
        context: context,
        title: const Text('Decorator Pattern Example'),
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    'Select your pizza:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              PizzaSelection(
                selectedIndex: _selectedIndex,
                onChanged: _onSelectedIndexChanged,
              ),
              if (_selectedIndex == 2)
                CustomPizzaSelection(
                  pizzaToppingsDataMap: _pizzaToppingsDataMap,
                  onSelected: _onCustomPizzaChipSelected,
                ),
              PizzaInformation(
                pizza: _pizza,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
