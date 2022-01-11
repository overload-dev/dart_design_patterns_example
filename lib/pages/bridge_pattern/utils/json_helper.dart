import 'dart:convert';

import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/customer.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/order.dart';

class JsonHelper {
  const JsonHelper._();

  static String serialiseObject(EntityBase entityBase) {
    return jsonEncode(entityBase);
  }

  static T deserialiseObject<T extends EntityBase>(String jsonString) {
    var json = jsonDecode(jsonString);

    switch (T) {
      case Customer:
        return Customer.fromJson(json) as T;
      case Order:
        return Order.formJson(json) as T;
      default:
        throw Exception("Type of '$T' is not supported");
    }
  }
}
