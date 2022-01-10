import 'package:dart_design_patterns_example/pages/proxy_pattern/components/customer_info_group.dart';
import 'package:dart_design_patterns_example/pages/proxy_pattern/models/custommer_details.dart';
import 'package:flutter/material.dart';

class CustomerDetailsColumn extends StatelessWidget {
  final CustomerDetails customerDetails;

  const CustomerDetailsColumn({
    Key? key,
    required this.customerDetails,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        CustomerInfoGroup(
          label: 'E-mail',
          text: customerDetails.email,
        ),
        const SizedBox(height: 25.0),
        CustomerInfoGroup(
          label: 'Position',
          text: customerDetails.position,
        ),
        const SizedBox(height: 25.0),
        CustomerInfoGroup(
          label: 'Hobby',
          text: customerDetails.hobby,
        ),
      ],
    );
  }
}
