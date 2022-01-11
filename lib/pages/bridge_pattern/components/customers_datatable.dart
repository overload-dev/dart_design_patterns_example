import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/customer.dart';
import 'package:flutter/material.dart';

class CustomersDatatable extends StatelessWidget {
  final List<Customer> customers;

  const CustomersDatatable({
    Key? key,
    required this.customers,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: 15.0,
        horizontalMargin: 15.0,
        headingRowHeight: 25.0,
        dataRowHeight: 25.0,
        columns: const <DataColumn>[
          DataColumn(
            label: Text(
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              'E-mail',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
        ],
        rows: <DataRow>[
          for (var customer in customers)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(customer.name)),
                DataCell(Text(customer.email)),
              ],
            ),
        ],
      ),
    );
  }
}
