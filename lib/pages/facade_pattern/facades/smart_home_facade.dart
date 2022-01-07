import 'package:dart_design_patterns_example/pages/facade_pattern/apis/audio_api.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/apis/netflix_api.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/apis/smart_hom_api.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/apis/tv_api.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/facades/gaming_facade.dart';
import 'package:dart_design_patterns_example/pages/facade_pattern/states/smart_home_state.dart';

class SmartHomeFacade {
  final GamingFacade _gamingFacade = GamingFacade();

  final TvApi _tvApi = TvApi();
  final AudioApi _audioApi = AudioApi();
  final NetflixApi _netflixApi = NetflixApi();
  final SmartHomeApi _smartHomeApi = SmartHomeApi();

  void startMovie(SmartHomeState smartHomeState, String movieTitle) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightOff();
    smartHomeState.tvOn = _tvApi.turnOn();
    smartHomeState.audioSystemOn = _audioApi.turnSpeakersOn();
    smartHomeState.netflixConnected = _netflixApi.connect();

    _netflixApi.play(movieTitle);
  }

  void stopMovie(SmartHomeState smartHomeState) {
    smartHomeState.netflixConnected = _netflixApi.disconnect();
    smartHomeState.tvOn = _tvApi.turnOff();
    smartHomeState.audioSystemOn = _audioApi.turnSpeakersOff();
    smartHomeState.lightsOn = _smartHomeApi.turnLightOn();
  }

  void startGaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightOff();
    smartHomeState.tvOn = _tvApi.turnOn();
    _gamingFacade.startGaming(smartHomeState);
  }

  void stopGaming(SmartHomeState smartHomeState) {
    _gamingFacade.stopGaming(smartHomeState);
    smartHomeState.tvOn = _tvApi.turnOff();
    smartHomeState.lightsOn = _smartHomeApi.turnLightOn();
  }

  void startStreaming(SmartHomeState smartHomeState) {
    smartHomeState.lightsOn = _smartHomeApi.turnLightOn();
    smartHomeState.tvOn = _tvApi.turnOn();
    _gamingFacade.startStreaming(smartHomeState);
  }

  void stopStreaming(SmartHomeState smartHomeState) {
    _gamingFacade.stopStreaming(smartHomeState);
    smartHomeState.tvOn = _tvApi.turnOff();
    smartHomeState.lightsOn = _smartHomeApi.turnLightOn();
  }
}
