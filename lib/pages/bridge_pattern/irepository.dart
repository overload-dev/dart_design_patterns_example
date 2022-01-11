import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';

abstract class IRepository {
  List<EntityBase> getAll();
  void save(EntityBase entityBase);
}
