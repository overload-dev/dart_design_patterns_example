import 'dart:async';

import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_change_direction.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscriber.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker_symbole.dart';
import 'package:faker/faker.dart';
import 'package:flutter/foundation.dart';

abstract class StockTicker {
  late final String title;
  late final Timer stockTimer;

  @protected
  Stock? stock;

  final List<StockSubscriber> _subscribers = [];

  void subscribe(StockSubscriber subscriber) => _subscribers.add(subscriber);

  void unsubscribe(StockSubscriber subscriber) =>
      _subscribers.removeWhere((s) => s.id == subscriber.id);

  void notifySubscribers() {
    for (final StockSubscriber subscriber in _subscribers) {
      subscriber.update(stock!);
    }
  }

  void setStock(StockTickerSymbol stockTickerSymbol, int min, int max) {
    final lastStock = stock;
    final price = faker.randomGenerator.integer(max, min: min) / 100;
    final changeAmount = lastStock != null ? price - lastStock.price : 0.0;

    stock = Stock(
      changeAmount: changeAmount.abs(),
      changeDirection: changeAmount > 0
          ? StockChangeDirection.growing
          : StockChangeDirection.falling,
      price: price,
      symbol: stockTickerSymbol,
    );
  }

  void stopTicker(){
    stockTimer.cancel();
  }
}
