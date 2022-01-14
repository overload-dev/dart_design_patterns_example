import 'package:dart_design_patterns_example/pages/observer_pattern/stock_change_direction.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker_symbole.dart';

class Stock {
  final StockTickerSymbol symbol;
  final StockChangeDirection changeDirection;
  final double price;
  final double changeAmount;

  const Stock({
    required this.symbol,
    required this.changeDirection,
    required this.price,
    required this.changeAmount,
  });
}
