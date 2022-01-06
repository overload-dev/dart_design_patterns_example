import 'package:dart_design_patterns_example/pages/strategy/models/order_item.dart';

class Order {
  final List<OrderItem> items = [];

  double get price =>
      items.fold(0.0, (sum, orderItem) => sum + orderItem.price!);

  void addOrderItem(OrderItem orderItem){
    items.add(orderItem);
  }


}