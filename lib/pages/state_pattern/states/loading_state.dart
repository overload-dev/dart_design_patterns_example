import 'package:dart_design_patterns_example/pages/state_pattern/apis/fake_api.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/error_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/istate.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/loaded_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/no_results_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/state_context.dart';
import 'package:flutter/material.dart';

class LoadingState implements IState {
  final FakeApi _api = FakeApi();

  @override
  Future nextState(StateContext context) async {
    try {
      var resultList = await _api.getNames();

      if (resultList.isEmpty) {
        context.setState(NoResultsState());
      } else {
        context.setState(LoadedState(resultList));
      }
    } on Exception {
      context.setState(ErrorState());
    }
  }

  @override
  Widget render() {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.transparent,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
      ),
    );
  }
}
