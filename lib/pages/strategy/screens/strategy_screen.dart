import 'package:dart_design_patterns_example/pages/strategy/components/order_buttons.dart';
import 'package:dart_design_patterns_example/pages/strategy/models/order.dart';
import 'package:dart_design_patterns_example/pages/strategy/models/order_item.dart';
import 'package:dart_design_patterns_example/pages/strategy/models/order_items_table.dart';
import 'package:dart_design_patterns_example/pages/strategy/models/order_summary.dart';
import 'package:dart_design_patterns_example/pages/strategy/models/shopping_options.dart';
import 'package:dart_design_patterns_example/pages/strategy/strategies/in_store_pickup_strategy.dart';
import 'package:dart_design_patterns_example/pages/strategy/strategies/ishipping_costs_strategy.dart';
import 'package:dart_design_patterns_example/pages/strategy/strategies/parcel_terminal_shipping_strategy.dart';
import 'package:dart_design_patterns_example/pages/strategy/strategies/priority_shipping_stragety.dart';
import 'package:flutter/material.dart';

class StrategyScreen extends StatefulWidget {
  static String routeName ='/strategy_screen';
  const StrategyScreen({Key? key}) : super(key: key);

  @override
  _StrategyScreenState createState() => _StrategyScreenState();
}

class _StrategyScreenState extends State<StrategyScreen> {
  final List<IShippingCostsStrategy> _shippingCostsStrategyList = [
    InStorePickupStrategy(),
    ParcelTerminalShippingStrategy(),
    PriorityShippingStrategy(),
  ];

  int _selectedStrategyIndex = 0;
  Order _order = Order();

  void _addToOrder() {
    setState(() {
      _order.addOrderItem(OrderItem.random());
    });
  }

  void _clearOrder() {
    setState(() {
      _order = Order();
    });
  }

  void _setSelectedStrategyIndex(int? index) {
    setState(() {
      _selectedStrategyIndex = index!;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Strategy Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 20.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              OrderButtons(
                onAdd: _addToOrder,
                onClear: _clearOrder,
              ),
              const SizedBox(height: 0),
              Stack(
                children: <Widget>[
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 1.0 : 0.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'Your order is empty',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                      ],
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 500),
                    opacity: _order.items.isEmpty ? 0.0 : 1.0,
                    child: Column(
                      children: <Widget>[
                        OrderItemsTable(
                          orderItems: _order.items,
                        ),

                        ShippingOptions(
                          selectedIndex: _selectedStrategyIndex,
                          shippingOptions: _shippingCostsStrategyList,
                          onChanged: _setSelectedStrategyIndex,
                        ),
                        OrderSummary(
                          shippingCostsStrategy:
                          _shippingCostsStrategyList[_selectedStrategyIndex],
                          order: _order,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
