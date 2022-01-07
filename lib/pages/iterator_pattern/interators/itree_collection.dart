import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_iterator.dart';

abstract class ITreeCollection {
  ITreeIterator createIterator();

  String getTitle();
}