import 'package:flutter/cupertino.dart';
import '../factories/iactivity_indicator.dart';

class IosActivityIndicator implements IActivityIndicator {
  @override
  Widget render() {
    return const CupertinoActivityIndicator();
  }
}
