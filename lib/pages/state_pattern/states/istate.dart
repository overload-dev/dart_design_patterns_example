import 'package:dart_design_patterns_example/pages/state_pattern/states/state_context.dart';
import 'package:flutter/material.dart';

abstract class IState {
  Future nextState(StateContext context);
  Widget render();
}