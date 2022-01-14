import 'dart:async';

import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker_symbole.dart';

class TeslaStockTicker extends StockTicker {
  TeslaStockTicker() {
    title = StockTickerSymbol.TSLA.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
          (_) {
        setStock(StockTickerSymbol.TSLA, 60000, 65000);
        notifySubscribers();
      },
    );
  }
}
