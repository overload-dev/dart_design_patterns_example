import 'package:dart_design_patterns_example/pages/facade_pattern/components/device_icon.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/components/mode_switcher.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/facades/smart_home_facade.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/states/smart_home_state.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class FacadePatternScreen extends StatefulWidget {
  static String routeName = '/facade_pattern_screen';

  const FacadePatternScreen({Key? key}) : super(key: key);

  @override
  _FacadePatternScreenState createState() => _FacadePatternScreenState();
}

class _FacadePatternScreenState extends State<FacadePatternScreen> {
  final SmartHomeFacade _smartHomeFacade = SmartHomeFacade();
  final SmartHomeState _smartHomeState = SmartHomeState();

  bool _homeCinemaModeOn = false;
  bool _gamingModeOn = false;
  bool _streamingModeOn = false;

  bool get _isAnyModeOn =>
      _homeCinemaModeOn || _gamingModeOn || _streamingModeOn;

  void _changeHomeCinemaMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startMovie(_smartHomeState, 'Movie Title');
    } else {
      _smartHomeFacade.stopMovie(_smartHomeState);
    }

    setState(() {
      _homeCinemaModeOn = activated;
    });
  }

  void _changeGamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startGaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopGaming(_smartHomeState);
    }

    setState(() {
      _gamingModeOn = activated;
    });
  }

  void _changeStreamingMode(bool activated) {
    if (activated) {
      _smartHomeFacade.startStreaming(_smartHomeState);
    } else {
      _smartHomeFacade.stopStreaming(_smartHomeState);
    }

    setState(() {
      _streamingModeOn = activated;
    });
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
            children: [
              ModeSwitcher(
                title: 'Home cinema mode',
                activated: _homeCinemaModeOn,
                onChanged: !_isAnyModeOn || _homeCinemaModeOn
                    ? _changeHomeCinemaMode
                    : null,
              ),
              ModeSwitcher(
                title: 'Gaming mode',
                activated: _gamingModeOn,
                onChanged:
                    !_isAnyModeOn || _gamingModeOn ? _changeGamingMode : null,
              ),
              ModeSwitcher(
                title: 'Streaming mode',
                activated: _streamingModeOn,
                onChanged: !_isAnyModeOn || _streamingModeOn
                    ? _changeStreamingMode
                    : null,
              ),
              const SizedBox(height: 50.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DeviceIcon(
                        iconData: FontAwesomeIcons.tv,
                        activated: _smartHomeState.tvOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.film,
                        activated: _smartHomeState.netflixConnected,
                      ),
                      DeviceIcon(
                        iconData: Icons.speaker,
                        activated: _smartHomeState.audioSystemOn,
                      ),
                    ],
                  )
                ],
              ),
              const SizedBox(height: 25.0),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      DeviceIcon(
                        iconData: FontAwesomeIcons.playstation,
                        activated: _smartHomeState.gamingConsoleOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.video,
                        activated: _smartHomeState.streamingCameraOn,
                      ),
                      DeviceIcon(
                        iconData: FontAwesomeIcons.lightbulb,
                        activated: _smartHomeState.lightsOn,
                      ),
                    ],
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
