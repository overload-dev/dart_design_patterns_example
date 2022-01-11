import 'dart:io';

import 'package:dart_design_patterns_example/components/android_app_bar.dart';
import 'package:dart_design_patterns_example/components/iapp_bar.dart';
import 'package:dart_design_patterns_example/components/ios_app_bar.dart';
import 'package:dart_design_patterns_example/components/platform_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_cupertino_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_material_scaffold.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BridgePatternScreen extends StatefulWidget {
  static String routeName = '/bridge_pattern_screen';

  const BridgePatternScreen({Key? key}) : super(key: key);

  @override
  _BridgePatternScreenState createState() => _BridgePatternScreenState();
}

class _BridgePatternScreenState extends State<BridgePatternScreen> {
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

  @override
  void initState() {
    super.initState();
    setState(() {
      scaffold = scaffoldList[platformIndex];
      appbar = appbarList[platformIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffold.render(
      context: context,
      appbar: appbar.render(
        context: context,
        title: const Text('Bridge Pattern Example'),
      ),
      child: Container(),
    );
  }
}
