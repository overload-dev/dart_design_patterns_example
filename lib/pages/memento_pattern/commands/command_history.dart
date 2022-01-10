import 'dart:collection';

import 'package:dart_design_patterns_example/pages/memento_pattern/commands/icommand.dart';

class CommandHistory {
  final ListQueue<ICommand> _commandList = ListQueue<ICommand>();

  bool get isEmpty => _commandList.isEmpty;

  void add(ICommand command) {
    _commandList.add(command);
  }

  void undo() {
    if (_commandList.isNotEmpty) {
      var command = _commandList.removeLast();
      command.undo();
    }
  }
}
