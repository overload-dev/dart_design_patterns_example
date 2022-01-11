import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';
import 'package:faker/faker.dart';

class Customer extends EntityBase {
  late String name;
  late String email;

  Customer() : super() {
    name = faker.person.name();
    email = faker.internet.email();
  }

  Customer.fromJson(Map<String, dynamic> json)
      : name = json['name'],
        email = json['email'],
        super.fromJson(json);

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'email': email,
      };
}
