enum StockTickerSymbol {
  GME,
  GOOGL,
  TSLA,
}

extension StockTickerSymboleExtension on StockTickerSymbol {
  String toShortString() => toString().split('.').last;
}
