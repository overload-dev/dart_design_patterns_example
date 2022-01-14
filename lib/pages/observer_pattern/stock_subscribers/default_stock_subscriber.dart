import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscriber.dart';

class DefaultStockSubscriber extends StockSubscriber {
  DefaultStockSubscriber() {
    title = 'All stocks';
  }

  @override
  void update(Stock stock) {
    stockStreamController.add(stock);
  }
}
