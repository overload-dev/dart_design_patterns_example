import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/breadth_first_iterator.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/graph.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_collection.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_iterator.dart';

class BreadthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const BreadthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return BreadthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Breadth-first';
  }
}
