import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';

abstract class IStorage {
  String getTitle();

  List<T> fetchAll<T extends EntityBase>();

  void store<T extends EntityBase>(T entityBase);
}
