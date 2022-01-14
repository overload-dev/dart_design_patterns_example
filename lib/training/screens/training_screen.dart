import 'dart:io';

import 'package:dart_design_patterns_example/training/theme_factory/appbars/android_appbar.dart';
import 'package:dart_design_patterns_example/training/theme_factory/appbars/ios_apppbar.dart';
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
  final List<IScaffold> scaffolds = [
    AndroidScaffold(),
    IOSScaffold(),
  ];
  late IScaffold _sScaffold;

  final List<IAppBar> appbars = [
    AndroidAppBar(),
    IOSAppBar(),
  ];
  late IAppBar _sAppBar;

  int selectedPlatformIndex = Platform.isIOS ? 1 : 0;

  @override
  void initState() {
    super.initState();
    setState(() {
      _sScaffold = scaffolds[selectedPlatformIndex];
      _sAppBar = appbars[selectedPlatformIndex];
    });
  }

  void _setPlatform(){
    setState(() {
      selectedPlatformIndex = selectedPlatformIndex == 1 ? 0 : 1;
      _sScaffold = scaffolds[selectedPlatformIndex];
      _sAppBar = appbars[selectedPlatformIndex];
    });



  }

  @override
  Widget build(BuildContext context) {
    return _sScaffold.build(
      context: context,
      appBar: _sAppBar.build(
        context: context,
        leading: IconButton(onPressed: (){
          Navigator.of(context).pop();
        }, icon: Icon(Icons.arrow_back_ios)),
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
        child: TextButton(
          child: Text('Change Theme'),
          onPressed: _setPlatform,
        ),
      ),
    );
  }
}
