import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/commands/change_color_command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/commands/change_height_command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/commands/change_width_command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/commands/command.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/commands/command_history.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/components/command_history_column.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/components/shape_container.dart';
import 'package:dart_design_patterns_example/pages/command_pattern/models/shape.dart';
import 'package:flutter/material.dart';

class CommandPatternScreen extends StatefulWidget {
  static String routeName = '/command_pattern_screen';

  const CommandPatternScreen({Key? key}) : super(key: key);

  @override
  _CommandPatternScreenState createState() => _CommandPatternScreenState();
}

class _CommandPatternScreenState extends State<CommandPatternScreen> {
  final CommandHistory _commandHistory = CommandHistory();
  final Shape _shape = Shape.initial();

  void _changeColor() {
    var command = ChangeColorCommand(_shape);
    _executeCommand(command);
  }

  void _changeHeight() {
    var command = ChangeHeightCommand(_shape);
    _executeCommand(command);
  }

  void _changeWidth() {
    var command = ChangeWidthCommand(_shape);
    _executeCommand(command);
  }

  void _executeCommand(Command command) {
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
        child: ProjectAppBar(title: 'Command Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              ShapeContainer(
                shape: _shape,
              ),
              const SizedBox(
                height: 15.0,
              ),
              PlatformButton(
                child: const Text('Change Color'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeColor,
              ),
              PlatformButton(
                child: const Text('Change Height'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeHeight,
              ),
              PlatformButton(
                child: const Text('Change Width'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeWidth,
              ),
              const Divider(),
              PlatformButton(
                child: const Text('Undo'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _undo,
              ),
              const SizedBox(height: 10.0),
              Row(
                children: [
                  CommandHistoryColumn(
                    commandList: _commandHistory.commandHistoryList,
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
