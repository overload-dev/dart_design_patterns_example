import 'dart:io';

import 'package:dart_design_patterns_example/training/theme_factory/appbars/android_appbar.dart';
import 'package:dart_design_patterns_example/training/theme_factory/appbars/ios_apppbar.dart';
import 'package:dart_design_patterns_example/training/theme_factory/buttons/ibutton.dart';
import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iappbar.dart';
import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iscaffold.dart';

import 'package:dart_design_patterns_example/training/theme_factory/scaffolds/android_scaffold.dart';
import 'package:dart_design_patterns_example/training/theme_factory/scaffolds/ios_scaffold.dart';
import 'package:flutter/material.dart';

class TrainingScreen extends StatefulWidget {
  static String routeName = '/training_screen';

  const TrainingScreen({Key? key}) : super(key: key);

  @override
  _TrainingScreenState createState() => _TrainingScreenState();
}

class _TrainingScreenState extends State<TrainingScreen> {
  final List<IScaffold> scaffolds = [AndroidScaffold(), IOSScaffold()];
  final List<IAppBar> appbars = [AndroidAppBar(), IOSAppBar()];
  final List<IButton> buttons = [AndroidButton(), IOSButton()];

  late IScaffold _sScaffold;
  late IAppBar _sAppBar;
  late IButton _sButton;

  int selectedPlatformIndex = Platform.isIOS ? 1 : 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _sScaffold = scaffolds[selectedPlatformIndex];
      _sAppBar = appbars[selectedPlatformIndex];
      _sButton = buttons[selectedPlatformIndex];
    });
  }

  void _setPlatform() {
    setState(() {
      selectedPlatformIndex = selectedPlatformIndex == 1 ? 0 : 1;
      _sScaffold = scaffolds[selectedPlatformIndex];
      _sAppBar = appbars[selectedPlatformIndex];
      _sButton = buttons[selectedPlatformIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return _sScaffold.build(
      context: context,
      appBar: _sAppBar.build(
        context: context,
        leading: null,
        title: const Text(
          'AppBar Test',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const Icon(Icons.star)),
          IconButton(onPressed: () {}, icon: const Icon(Icons.add))
        ],
      ),
      child: Center(
        child: _sButton.build(context: context,
          child: const Text('Change Theme'),
          onPressed: _setPlatform,),
      ),
    );
  }
}
