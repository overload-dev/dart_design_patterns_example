import 'dart:async';

import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker_symbole.dart';

class GoogleStockTicker extends StockTicker {
  GoogleStockTicker() {
    title = StockTickerSymbol.GOOGL.toShortString();
    stockTimer = Timer.periodic(
      const Duration(seconds: 2),
          (_) {
        setStock(StockTickerSymbol.GOOGL, 200000, 204000);
        notifySubscribers();
      },
    );
  }
}
