import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builders/big_mac_builder.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builders/cheeseburger_builder.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builders/hamburger_builder.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_builders/mc_chicken_builder.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_maker.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/burger_menu_item.dart';
import 'package:dart_design_patterns_example/pages/builder_pattern/components/burger_information_column.dart';
import 'package:flutter/material.dart';

class BuilderPatternScreen extends StatefulWidget {
  static String routeName = '/builder_pattern_screen';

  const BuilderPatternScreen({Key? key}) : super(key: key);

  @override
  _BuilderPatternScreenState createState() => _BuilderPatternScreenState();
}

class _BuilderPatternScreenState extends State<BuilderPatternScreen> {
  final BurgerMaker _burgerMaker = BurgerMaker(HamburgerBuilder());
  final List<BurgerMenuItem> _burgerMenuItems = [];

  late BurgerMenuItem _selectedBurgerMenuItem;
  late Burger _selectedBurger;

  @override
  void initState() {
    super.initState();

    _burgerMenuItems.addAll([
      BurgerMenuItem(
        label: 'Hamburger',
        burgerBuilder: HamburgerBuilder(),
      ),
      BurgerMenuItem(
        label: 'Cheeseburger',
        burgerBuilder: CheeseburgerBuilder(),
      ),
      BurgerMenuItem(
        label: 'Big Mac\u00AE',
        burgerBuilder: BigMacBuilder(),
      ),
      BurgerMenuItem(
        label: 'McChicken\u00AE',
        burgerBuilder: McChickenBuilder(),
      )
    ]);

    _selectedBurgerMenuItem = _burgerMenuItems[0];
    _selectedBurger = _prepareSelectedBurger();
  }

  Burger _prepareSelectedBurger() {
    _burgerMaker.prepareBurger();
    return _burgerMaker.getBurger();
  }

  void _onBurgerMenuItemChanged(BurgerMenuItem? selectedItem) {

    debugPrint(selectedItem.toString());

    setState(() {
      _selectedBurgerMenuItem = selectedItem!;
      _burgerMaker.changeBurgerBuilder(selectedItem.burgerBuilder);
      _selectedBurger = _prepareSelectedBurger();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Builder Pattern Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'select menu item:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              DropdownButton(
                value: _selectedBurgerMenuItem,
                items: _burgerMenuItems
                    .map<DropdownMenuItem<BurgerMenuItem>>(
                      (BurgerMenuItem item) => DropdownMenuItem(
                        value: item,
                        child: Text(item.label),
                      ),
                    )
                    .toList(),
                onChanged: _onBurgerMenuItemChanged,
              ),
              const SizedBox(height: 25.0),
              Row(
                children: [
                  Text(
                    'Information:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              const SizedBox(height: 15.0),
              BurgerInformationColumn(burger: _selectedBurger),
            ],
          ),
        ),
      ),
    );
  }
}
