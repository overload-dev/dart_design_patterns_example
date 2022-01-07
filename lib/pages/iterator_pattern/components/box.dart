import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final int nodeId;
  final Color color;
  final Widget? child;

  const Box({Key? key,
    required this.nodeId,
    required this.color,
    this.child,
  }): super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4.0,
      color: color,
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            Text(
              nodeId.toString(),
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: 20.0),
            if (child != null) child!,
          ],
        ),
      ),
    );
  }
}