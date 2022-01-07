import 'package:flutter/foundation.dart';

class NetflixApi {
  bool connect() {
    return true;
  }

  bool disconnect() {
    return false;
  }

  void play(String title) {
    debugPrint("'$title' has started started playing on Netflix.");
  }
}
