import 'package:dart_design_patterns_example/pages/strategy_pattern/models/order_summary_row.dart';
import 'package:dart_design_patterns_example/pages/strategy_pattern/strategies/ishipping_costs_strategy.dart';
import 'package:flutter/material.dart';

import 'order.dart';

class OrderSummary extends StatelessWidget {
  final Order order;
  final IShippingCostsStrategy shippingCostsStrategy;

  const OrderSummary({
    Key? key,
    required this.order,
    required this.shippingCostsStrategy,
  }) : super(key: key);

  double get shippingPrice => shippingCostsStrategy.calculate(order);

  double get total => order.price + shippingPrice;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(17),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'Order summary',
              style: Theme.of(context).textTheme.headline6,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Subtotal',
              value: order.price,
            ),
            const SizedBox(height: 17),
            OrderSummaryRow(
              fontFamily: 'Roboto',
              label: 'Shipping',
              value: shippingPrice,
            ),
            const Divider(),
            OrderSummaryRow(
              fontFamily: 'RobotoMedium',
              label: 'Order total',
              value: total,
            ),
          ],
        ),
      ),
    );
  }
}
