import 'dart:async';

import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';

abstract class StockSubscriber {
  late final String title;
  final String id = faker.guid.guid();

  @protected
  final StreamController<Stock> stockStreamController =
      StreamController.broadcast();

  Stream<Stock> get stockStream => stockStreamController.stream;

  void update(Stock stock);
}
