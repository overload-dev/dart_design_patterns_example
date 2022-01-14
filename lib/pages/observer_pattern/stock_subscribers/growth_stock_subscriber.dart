import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_change_direction.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscriber.dart';

class GrowingStockSubscriber extends StockSubscriber {
  GrowingStockSubscriber() {
    title = 'Growing stocks';
  }

  @override
  void update(Stock stock) {
    if (stock.changeDirection == StockChangeDirection.growing) {
      stockStreamController.add(stock);
    }
  }
}
