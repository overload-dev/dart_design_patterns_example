import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/customer.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/irepository.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/istorage.dart';

class CustomersRepository implements IRepository {
  final IStorage storage;

  const CustomersRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Customer>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Customer>(entityBase as Customer);
  }
}
