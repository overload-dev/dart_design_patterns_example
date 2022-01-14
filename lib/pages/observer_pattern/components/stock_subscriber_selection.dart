import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscriber.dart';
import 'package:flutter/material.dart';

class StockSubscriberSelection extends StatelessWidget {
  final List<StockSubscriber> stockSubscriberList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const StockSubscriberSelection({ Key? key,
    required this.stockSubscriberList,
    required this.selectedIndex,
    required this.onChanged,
  }):super(key:key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        for (var i = 0; i < stockSubscriberList.length; i++)
          RadioListTile(
            title: Text(stockSubscriberList[i].title),
            value: i,
            groupValue: selectedIndex,
            selected: i == selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          ),
      ],
    );
  }
}