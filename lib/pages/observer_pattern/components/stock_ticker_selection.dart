import 'package:dart_design_patterns_example/pages/observer_pattern/models/stock_ticker_model.dart';
import 'package:flutter/material.dart';

class StockTickerSelection extends StatelessWidget {
  final List<StockTickerModel> stockTickers;
  final ValueChanged<int> onChanged;

  const StockTickerSelection({Key? key,
    required this.stockTickers,
    required this.onChanged,
  }): super(key:key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        for (var i = 0; i < stockTickers.length; i++)
          Expanded(
            child: _TickerTile(
              stockTickerModel: stockTickers[i],
              index: i,
              onChanged: onChanged,
            ),
          )
      ],
    );
  }
}

class _TickerTile extends StatelessWidget {
  final StockTickerModel stockTickerModel;
  final int index;
  final ValueChanged<int> onChanged;

  const _TickerTile({
    required this.stockTickerModel,
    required this.index,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      color: stockTickerModel.subscribed ? Colors.black : Colors.white,
      child: InkWell(
        onTap: () => onChanged(index),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(
            stockTickerModel.stockTicker.title,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: stockTickerModel.subscribed ? Colors.white : Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}