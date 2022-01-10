import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/components/customer_details_column.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/models/customer.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/proxies/icustomer_details_service.dart';
import 'package:flutter/material.dart';

class CustomerDetailsDialog extends StatefulWidget {
  final Customer customer;
  final ICustomerDetailsService service;

  const CustomerDetailsDialog({
    Key? key,
    required this.customer,
    required this.service,
  }) : super(key: key);

  @override
  _CustomerDetailsDialogState createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    widget.service.getCustomerDetails(widget.customer.id).then(
          (CustomerDetails customerDetails) => setState(
            () {
              widget.customer.details = customerDetails;
              isLoading = false;
            },
          ),
        );
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: SizedBox(
        height: 200.0,
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: Colors.grey,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(0.65),
                  ),
                ),
              )
            : CustomerDetailsColumn(
                customerDetails: widget.customer.details,
              ),
      ),
      actions: <Widget>[
        Visibility(
          visible: !isLoading,
          child: PlatformButton(
            materialColor: Colors.black,
            materialTextColor: Colors.white,
            onPressed: _closeDialog,
            child: const Text('Close'),
          ),
        ),
      ],
    );
  }
}
