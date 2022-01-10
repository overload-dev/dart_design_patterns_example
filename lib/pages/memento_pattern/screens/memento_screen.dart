import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/command_history.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/icommand.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/originator.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/randomise_properties_command.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/components/shape_container.dart';
import 'package:flutter/material.dart';

class MementoPatternScreen extends StatefulWidget {
  static String routeName = '/memento_screen';

  const MementoPatternScreen({Key? key}) : super(key: key);

  @override
  _MementoPatternScreenState createState() => _MementoPatternScreenState();
}

class _MementoPatternScreenState extends State<MementoPatternScreen> {
  final CommandHistory _commandHistory = CommandHistory();
  final Originator _originator = Originator();

  void _randomiseProperties() {
    var command = RandomisePropertiesCommand(_originator);
    _executeCommand(command);
  }

  void _executeCommand(ICommand command) {
    setState(() {
      command.execute();
      _commandHistory.add(command);
    });
  }

  void _undo() {
    setState(() {
      _commandHistory.undo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Memento Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              ShapeContainer(shape: _originator.state),
              const SizedBox(height: 25.0),
              PlatformButton(
                  child: const Text('Randomise properties'),
                  materialColor: Colors.black,
                  materialTextColor: Colors.white,
                  onPressed: _randomiseProperties),
              const Divider(),
              PlatformButton(
                child: const Text('Undo'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _commandHistory.isEmpty ? null : _undo,
              ),
              const SizedBox(height: 25.0),
            ],
          ),
        ),
      ),
    );
  }
}
