import 'package:dart_design_patterns_example/pages/abstract_factory_pattern/factories/iactivity_indicator.dart';
import 'package:flutter/material.dart';

class AndroidActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return CircularProgressIndicator(
      backgroundColor: const Color(0xFFECECEC),
      valueColor: AlwaysStoppedAnimation<Color>(
        Colors.black.withOpacity(0.65)
      ),
    );
  }

}