

import 'package:dart_design_patterns_example/pages/strategy/models/package_size.dart';
import 'package:faker/faker.dart';

class OrderItem {
  late final String? title;
  late final double? price;
  late final PackageSize? packageSize;

  OrderItem.random() {
    var packageSizeList = PackageSize.values;
    title = faker.lorem.word();
    price = random.integer(100, min: 5) - 0.01;
    packageSize = packageSizeList[random.integer(packageSizeList.length)];
  }
}
