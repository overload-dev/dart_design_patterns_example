import 'package:dart_design_patterns_example/pages/state_pattern/states/istate.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/loading_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/state_context.dart';
import 'package:flutter/material.dart';

class NoResultsState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return const Center(
      child: Text(
        'No Results',
        style: TextStyle(fontSize: 24.0),
        textAlign: TextAlign.center,
      ),
    );
  }
}
