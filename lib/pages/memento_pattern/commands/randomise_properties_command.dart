import 'package:dart_design_patterns_example/pages/memento_pattern/commands/icommand.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/imemento.dart';
import 'package:dart_design_patterns_example/pages/memento_pattern/commands/originator.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class RandomisePropertiesCommand implements ICommand {
  late Originator originator;
  late IMemento _backup;

  RandomisePropertiesCommand(this.originator) {
    _backup = originator.createMemento();
  }

  @override
  void execute() {
    var shape = originator.state;
    shape.color = Color.fromRGBO(
      random.integer(255),
      random.integer(255),
      random.integer(255),
      1.0,
    );

    shape.height = random.integer(150, min: 50).toDouble();
    shape.width = random.integer(150, min: 50).toDouble();
  }

  @override
  void undo() {
    if (_backup != null) {
      originator.restore(_backup);
    }
  }
}
