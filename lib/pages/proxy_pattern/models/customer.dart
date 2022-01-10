import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';
import 'package:faker/faker.dart';

class Customer {
  late String id;
  late String name;
  late CustomerDetails details;

  Customer() {
    id = faker.guid.guid();
    name = faker.person.name();
  }
}
