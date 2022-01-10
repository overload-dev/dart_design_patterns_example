import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/components/customer_details_dialog.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/models/customer.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/customer_details_service.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/customer_details_service_proxy.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/icustomer_details_service.dart';
import 'package:flutter/material.dart';

class ProxyPatternScreen extends StatefulWidget {
  static String routeName = '/proxy_pattern_screen';

  const ProxyPatternScreen({Key? key}) : super(key: key);

  @override
  _ProxyPatternScreenState createState() => _ProxyPatternScreenState();
}

class _ProxyPatternScreenState extends State<ProxyPatternScreen> {

  final ICustomerDetailsService _customerDetailsServiceProxy = CustomerDetailsServiceProxy(
      CustomerDetailsService());

  final List<Customer> _customerList = List.generate(10, (index) => Customer());

  void _showCustomerDetails(Customer customer) {
    showDialog(
      context: context,
      builder: (context) {
        return CustomerDetailsDialog(
          service: _customerDetailsServiceProxy,
          customer: customer,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Proxy Pattern Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text('Press on the list tile to see more information about the customer',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30.0),
              for (var customer in _customerList)
                Card(
                  child: ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.grey,
                      child: Text(
                        customer.name[0],
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                    trailing: const Icon(Icons.info_outline),
                    title: Text(customer.name),
                    onTap: () => _showCustomerDetails(customer),
                  ),
                )
            ],
          )
        ),
      ),
    );
  }
}
