import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/icustomer_details_service.dart';

class CustomerDetailsServiceProxy implements ICustomerDetailsService {
  final ICustomerDetailsService service;
  final Map<String, CustomerDetails> customerDetailsCache =
      <String, CustomerDetails>{};

  CustomerDetailsServiceProxy(this.service);

  @override
  Future<CustomerDetails> getCustomerDetails(String id) async {
    if (customerDetailsCache.containsKey(id)) {
      return customerDetailsCache[id]!;
    }

    var customerDetails = await service.getCustomerDetails(id);
    customerDetailsCache[id] = customerDetails;
    return customerDetails;
  }
}
