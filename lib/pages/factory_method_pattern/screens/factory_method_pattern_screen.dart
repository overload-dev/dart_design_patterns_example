import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/factory_method_pattern/components/dialog_selection.dart';
import 'package:dart_design_patterns_example/pages/factory_method_pattern/factories/android_alert_dialog.dart';
import 'package:dart_design_patterns_example/pages/factory_method_pattern/factories/custom_dialog.dart';
import 'package:dart_design_patterns_example/pages/factory_method_pattern/factories/ios_alert_dialog.dart';
import 'package:flutter/material.dart';

class FactoryMethodPatternScreen extends StatefulWidget {
  static String routeName = '/factory_method_pattern_screen';

  const FactoryMethodPatternScreen({Key? key}) : super(key: key);

  @override
  _FactoryMethodPatternScreenState createState() =>
      _FactoryMethodPatternScreenState();
}

class _FactoryMethodPatternScreenState
    extends State<FactoryMethodPatternScreen> {
  final List<CustomDialog> customDialogList = [
    AndroidAlertDialog(),
    IosAlertDialog(),
  ];

  int _selectedDialogIndex = 0;

  Future _showCustomDialog(BuildContext context) async {
    var selectedDialog = customDialogList[_selectedDialogIndex];

    await selectedDialog.show(context);
  }

  void _setSelectedDialogIndex(int? index) {
    setState(() {
      _selectedDialogIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Factorty Method Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              DialogSelection(
                customDialogList: customDialogList,
                selectedIndex: _selectedDialogIndex,
                onChanged: _setSelectedDialogIndex,
              ),
              const SizedBox(
                height: 50.0,
              ),
              PlatformButton(
                child: const Text('Show Dialog'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: () => _showCustomDialog(context),
              )
            ],
          ),
        ),
      ),
    );
  }
}
