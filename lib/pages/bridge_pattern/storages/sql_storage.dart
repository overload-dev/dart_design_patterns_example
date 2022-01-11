import 'package:dart_design_patterns_example/pages/bridge_pattern/entities/entity_base.dart';
import 'package:dart_design_patterns_example/pages/bridge_pattern/istorage.dart';

class SqlStorage implements IStorage {
  Map<Type, List<EntityBase>> sqlStorage = {};

  @override
  String getTitle() {
    return 'SQL Storage';
  }

  @override
  List<T> fetchAll<T extends EntityBase>() {
    return sqlStorage.containsKey(T) ? sqlStorage[T] as List<T> : [];
  }

  @override
  void store<T extends EntityBase>(T entityBase) {
    if (!sqlStorage.containsKey(T)) {
      sqlStorage[T] = <T>[];
    }

    sqlStorage[T]!.add(entityBase);
  }
}
