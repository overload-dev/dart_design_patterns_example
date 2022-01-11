import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/order.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/irepository.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/istorage.dart';

class OrdersRepository implements IRepository {
  final IStorage storage;

  const OrdersRepository(this.storage);

  @override
  List<EntityBase> getAll() {
    return storage.fetchAll<Order>();
  }

  @override
  void save(EntityBase entityBase) {
    storage.store<Order>(entityBase as Order);
  }
}
