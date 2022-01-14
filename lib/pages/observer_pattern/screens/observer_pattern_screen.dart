import 'dart:async';

import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/components/stock_row.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/components/stock_subscriber_selection.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/components/stock_ticker_selection.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/models/stock_ticker_model.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscriber.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscribers/default_stock_subscriber.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_subscribers/growth_stock_subscriber.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker/gamestop_stock_ticker.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker/google_stock_ticker.dart';
import 'package:dart_design_patterns_example/pages/observer_pattern/stock_ticker/tesla_stock_ticker.dart';
import 'package:flutter/material.dart';

class ObserverPatternScreen extends StatefulWidget {
  static String routeName = '/observer_pattern_screen';

  const ObserverPatternScreen({Key? key}) : super(key: key);

  @override
  _ObserverPatternScreenState createState() => _ObserverPatternScreenState();
}

class _ObserverPatternScreenState extends State<ObserverPatternScreen> {
  final _stockSubscriberList = <StockSubscriber>[
    DefaultStockSubscriber(),
    GrowingStockSubscriber(),
  ];

  final _stockTickers = <StockTickerModel>[
    StockTickerModel(stockTicker: GameStopStockTicker()),
    StockTickerModel(stockTicker: GoogleStockTicker()),
    StockTickerModel(stockTicker: TeslaStockTicker()),
  ];

  final _stockEntries = <Stock>[];

  StreamSubscription<Stock>? _stockStreamSubscription;
  final StockSubscriber _subscriber = DefaultStockSubscriber();
  int _selectedSubscriberIndex = 0;

  @override
  void initState() {
    super.initState();
    _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
  }

  @override
  void dispose() {
    for (final StockTickerModel ticker in _stockTickers) {
      ticker.stockTicker.stopTicker();
    }

    _stockStreamSubscription?.cancel();

    super.dispose();
  }

  void _onStockChange(Stock stock) {

    setState(() {
      if(_stockEntries.length > 10){
        _stockEntries.removeAt(0);
      }
      _stockEntries.add(stock);
    });
  }

  void _setSelectedSubscriberIndex(int? index) {
    for (final StockTickerModel ticker in _stockTickers) {
      if (ticker.subscribed) {
        ticker.toggleSubscribed();
        ticker.stockTicker.unsubscribe(_subscriber);
      }
    }

    _stockStreamSubscription?.cancel();

    setState(() {
      _stockEntries.clear();
      _selectedSubscriberIndex = index!;
      _stockStreamSubscription = _subscriber.stockStream.listen(_onStockChange);
    });
  }

  void _toggleStockTickerSelection(int index) {
    final stockTickerModel = _stockTickers[index];
    final stockTicker = stockTickerModel.stockTicker;

    if (stockTickerModel.subscribed) {
      stockTicker.unsubscribe(_subscriber);
    } else {
      stockTicker.subscribe(_subscriber);
    }

    setState(() {
      stockTickerModel.toggleSubscribed();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Observer Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              StockSubscriberSelection(
                stockSubscriberList: _stockSubscriberList,
                selectedIndex: _selectedSubscriberIndex,
                onChanged: _setSelectedSubscriberIndex,
              ),
              StockTickerSelection(
                stockTickers: _stockTickers,
                onChanged: _toggleStockTickerSelection,
              ),
              Column(
                children: [
                  for (final stock in _stockEntries.reversed)
                    StockRow(stock: stock),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
