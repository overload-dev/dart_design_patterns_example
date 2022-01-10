import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/components/box.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/components/tree_collection_selection.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/breadth_first_tree_collection.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/depth_first_tree_collection.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/graph.dart';
import 'package:dart_design_patterns_example/pages/iterator_pattern/interators/itree_collection.dart';
import 'package:flutter/material.dart';

class IteratorPatternScreen extends StatefulWidget {
  static String routeName = '/iterator_pattern_screen';

  const IteratorPatternScreen({Key? key}) : super(key: key);

  @override
  State<IteratorPatternScreen> createState() => _IteratorPatternScreenState();
}

class _IteratorPatternScreenState extends State<IteratorPatternScreen> {
  final List<ITreeCollection> treeCollections = [];
  int _selectedTreeCollectionIndex = 0;
  int _currentNodeIndex = 0;
  bool _isTraversing = false;

  @override
  void initState() {
    super.initState();

    var graph = _buildGraph();
    treeCollections.add(BreadthFirstTreeCollection(graph));
    treeCollections.add(DepthFirstTreeCollection(graph));
  }

  Graph _buildGraph() {
    var graph = Graph();

    graph.addEdge(1, 2);
    graph.addEdge(1, 3);
    graph.addEdge(1, 4);
    graph.addEdge(2, 5);
    graph.addEdge(3, 6);
    graph.addEdge(3, 7);
    graph.addEdge(4, 8);

    return graph;
  }

  void _setSelectedTreeCollectionIndex(int? index) {
    debugPrint(index.toString());

    setState(() {
      _selectedTreeCollectionIndex = index!;
    });
  }

  Future _traverseTree() async {
    _toggleIsTraversing();
    var iterator =
        treeCollections[_selectedTreeCollectionIndex].createIterator();
    while (iterator.hasNext()) {
      setState(() {
        _currentNodeIndex = iterator.getNext()!;
      });

      await Future.delayed(const Duration(seconds: 1));
    }

    _toggleIsTraversing();
  }

  void _toggleIsTraversing() {
    setState(() {
      _isTraversing = !_isTraversing;
    });
  }

  void _reset() {
    setState(() {
      _currentNodeIndex = 0;
    });
  }

  Color _getBackgroundColor(int index) {
    return _currentNodeIndex == index ? Colors.red[200]! : Colors.white;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Iterator Patter Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            children: [
              TreeCollectionSelection(
                treeCollections: treeCollections,
                selectedIndex: _selectedTreeCollectionIndex,
                onChanged:
                    !_isTraversing ? _setSelectedTreeCollectionIndex : null,
              ),
              const SizedBox(height: 15.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PlatformButton(
                    child: const Text('Traverse'),
                    materialColor: Colors.black,
                    materialTextColor: Colors.white,
                    onPressed: _currentNodeIndex == 0 ? _traverseTree : null,
                  ),
                  PlatformButton(
                    child: const Text('Reset'),
                    materialColor: Colors.black,
                    materialTextColor: Colors.white,
                    onPressed:
                        _isTraversing || _currentNodeIndex == 0 ? null : _reset,
                  ),
                ],
              ),
              const SizedBox(height: 25.0),
              Box(
                nodeId: 1,
                color: _getBackgroundColor(1),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Box(
                      nodeId: 2,
                      color: _getBackgroundColor(2),
                      child: Box(
                        nodeId: 3,
                        color: _getBackgroundColor(5),
                      ),
                    ),
                    Box(
                      nodeId: 3,
                      color: _getBackgroundColor(3),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Box(
                            nodeId: 6,
                            color: _getBackgroundColor(6),
                          ),
                          Box(
                            nodeId: 7,
                            color: _getBackgroundColor(7),
                          ),
                        ],
                      ),
                    ),
                    Box(
                        nodeId: 4,
                        color: _getBackgroundColor(4),
                        child: Box(
                          nodeId: 8,
                          color: _getBackgroundColor(8),
                        )),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
