import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/depth_first_iterator.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/graph.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_collection.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_iterator.dart';

class DepthFirstTreeCollection implements ITreeCollection {
  final Graph graph;

  const DepthFirstTreeCollection(this.graph);

  @override
  ITreeIterator createIterator() {
    return DepthFirstIterator(this);
  }

  @override
  String getTitle() {
    return 'Depth-first';
  }
}
