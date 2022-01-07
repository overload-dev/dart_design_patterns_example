import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/istate.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/no_results_state.dart';
import 'package:dart_design_patterns_example/pages/state_pattern/states/state_context.dart';
import 'package:flutter/material.dart';

class StatePatternScreen extends StatefulWidget {
  static String routeName = '/state_pattern_screen';

  const StatePatternScreen({Key? key}) : super(key: key);

  @override
  State<StatePatternScreen> createState() => _StatePatternScreenState();
}

class _StatePatternScreenState extends State<StatePatternScreen> {
  final StateContext _stateContext = StateContext();

  Future<void> _changeState() async {
    await _stateContext.nextState();
  }

  @override
  void dispose() {
    _stateContext.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {


    return Scaffold(
      appBar: AppBar(
        title: const Text('State Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              PlatformButton(
                child: const Text('load names'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _changeState,
              ),
              const SizedBox(
                height: 25.0,
              ),
              StreamBuilder(
                initialData: NoResultsState(),
                stream: _stateContext.outState,
                builder: (context, AsyncSnapshot<IState> snapshot) {

                  return snapshot.data!.render();
                }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
