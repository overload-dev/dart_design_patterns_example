import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_change_direction.dart';
import 'package:flutter/material.dart';

class StockRow extends StatelessWidget {
  final Stock stock;

  Color get color => stock.changeDirection == StockChangeDirection.growing
      ? Colors.green
      : Colors.red;

  const StockRow({Key? key,
    required this.stock,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 80.0 * 2,
          child: Text(
            stock.symbol.toString().split('.').last,
            style: TextStyle(color: color),
          ),
        ),
        const SizedBox(width: 15.0),
        SizedBox(
          width: 50.0 * 2,
          child: Text(
            stock.price.toString(),
            style: TextStyle(color: color),
            textAlign: TextAlign.end,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 50.0,
          ),
          child: Icon(
            stock.changeDirection == StockChangeDirection.growing
                ? Icons.arrow_upward
                : Icons.arrow_downward,
            color: color,
          ),
        ),
        Text(
          stock.changeAmount.toStringAsFixed(2),
          style: TextStyle(color: color),
        ),
      ],
    );
  }
}