import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/icustomer_details_service.dart';
import 'package:faker/faker.dart';

class CustomerDetailsService extends ICustomerDetailsService {
  
  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    return Future.delayed(const Duration(seconds: 2), () {
      var email = faker.internet.email();
      var hobby = faker.sport.name();
      var position = faker.job.title();
      return CustomerDetails(id, email, hobby, position);
    });
  }
}
