import 'dart:io';

import 'package:dart_design_patterns_example/components/android_app_bar.dart';
import 'package:dart_design_patterns_example/components/iapp_bar.dart';
import 'package:dart_design_patterns_example/components/ios_app_bar.dart';
import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/platform_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_cupertino_scaffold.dart';
import 'package:dart_design_patterns_example/components/project_material_scaffold.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/components/customers_datatable.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/components/order_datatable.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/components/storage_selection.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/customer.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/order.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/irepository.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/istorage.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/repositories/customers_repository.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/repositories/orders_repository.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/storages/file_storage.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/storages/sql_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class BridgePatternScreen extends StatefulWidget {
  static String routeName = '/bridge_pattern_screen';

  const BridgePatternScreen({Key? key}) : super(key: key);

  @override
  _BridgePatternScreenState createState() => _BridgePatternScreenState();
}

class _BridgePatternScreenState extends State<BridgePatternScreen> {
  final List<PlatformScaffold> scaffoldList = [
    ProjectMaterialScaffold(),
    ProjectCupertinoScaffold()
  ];

  final List<IAppBar> appbarList = [
    AndroidAppBar(),
    IOSAppBar(),
  ];

  late PlatformScaffold scaffold;
  late IAppBar appbar;

  int platformIndex =
      kIsWeb || Platform.isAndroid || Platform.isWindows ? 0 : 1;

  final List<IStorage> _storages = [SqlStorage(), FileStorage()];

  late IRepository _customersRepository;
  late IRepository _ordersRepository;

  late List<Customer> _customers;
  late List<Order> _orders;

  int _selectedCustomerStorageIndex = 0;
  int _selectedOrderStorageIndex = 0;

  void _onSelectedCustomerStorageIndexChange(int? index) {
    setState(() {
      _selectedCustomerStorageIndex = index!;
      _customersRepository = CustomersRepository(_storages[index]);
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _onSelectedOrderStorageIndexChange(int? index) {
    setState(() {
      _selectedOrderStorageIndex = index!;
      _ordersRepository = OrdersRepository(_storages[index]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  void _addCustomer() {
    _customersRepository.save(Customer());
    setState(() {
      _customers = _customersRepository.getAll() as List<Customer>;
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());
    setState(() {
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      scaffold = scaffoldList[platformIndex];
      appbar = appbarList[platformIndex];

      _customersRepository =
          CustomersRepository(_storages[_selectedCustomerStorageIndex]);
      _customers = _customersRepository.getAll() as List<Customer>;

      _ordersRepository =
          OrdersRepository(_storages[_selectedCustomerStorageIndex]);
      _orders = _ordersRepository.getAll() as List<Order>;
    });
  }

  @override
  Widget build(BuildContext context) {
    return scaffold.render(
      context: context,
      appbar: appbar.render(
        context: context,
        title: const Text('Bridge Pattern Example'),
      ),
      child: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    'Select customers storage:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              StorageSelection(
                storages: _storages,
                selectedIndex: _selectedCustomerStorageIndex,
                onChanged: _onSelectedCustomerStorageIndexChange,
              ),
              PlatformButton(
                child: const Text('Add'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _addCustomer,
              ),
              _customers.isNotEmpty
                  ? CustomersDatatable(customers: _customers)
                  : Text(
                      '0 customers found',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
              const Divider(),
              Row(
                children: [
                  Text(
                    'Select orders Storage:',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ],
              ),
              StorageSelection(
                storages: _storages,
                selectedIndex: _selectedOrderStorageIndex,
                onChanged: _onSelectedOrderStorageIndexChange,
              ),
              PlatformButton(
                child: const Text('Add'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _addOrder,
              ),
              _orders.isNotEmpty
                  ? OrderDatatable(orders: _orders)
                  : Text(
                      '0 orders found',
                      style: Theme.of(context).textTheme.subtitle2,
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
