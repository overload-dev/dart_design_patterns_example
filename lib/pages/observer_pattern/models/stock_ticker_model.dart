import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker.dart';

class StockTickerModel {
  final StockTicker stockTicker;

  bool subscribed = false;

  StockTickerModel({
    required this.stockTicker,
  });

  void toggleSubscribed() {
    subscribed = !subscribed;
  }
}
