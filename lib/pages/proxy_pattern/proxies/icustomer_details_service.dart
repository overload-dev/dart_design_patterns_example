import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';

abstract class ICustomerDetailsService {
  Future<CustomerDetails> getCustomerDetails(String id);
}
