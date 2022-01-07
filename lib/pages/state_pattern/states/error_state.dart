import 'package:dart_design_patterns_example/pages/state_pattern/states/loading_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/state_context.dart';
import 'package:flutter/material.dart';

import 'istate.dart';

class ErrorState implements IState {
  @override
  Future nextState(StateContext context) async {
    context.setState(LoadingState());
  }

  @override
  Widget render() {
    return const Center(
      child: Text(
        'Oops! something went wrong...',
        style: TextStyle(
          color: Colors.red,
          fontSize: 24.0,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }

}