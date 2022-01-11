import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/order.dart';
import 'package:flutter/material.dart';

class OrderDatatable extends StatelessWidget {
  final List<Order> orders;

  const OrderDatatable({
    Key? key,
    required this.orders,
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
              'Dishes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
          ),
          DataColumn(
            label: Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.0),
            ),
            numeric: true,
          ),
        ],
        rows: <DataRow>[
          for (var order in orders)
            DataRow(
              cells: <DataCell>[
                DataCell(Text(order.dishes.join(', '))),
                DataCell(Text(order.total.toStringAsFixed(2))),
              ],
            ),
        ],
      ),
    );
  }
}
