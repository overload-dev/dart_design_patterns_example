import 'dart:async';

import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker_symbole.dart';

class GameStopStockTicker extends StockTicker {
  GameStopStockTicker() {
    title = StockTickerSymbol.GME.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
      (_) {
        setStock(StockTickerSymbol.GME, 16000, 22000);
        notifySubscribers();
      },
    );
  }
}
