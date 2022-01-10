import 'package:flutter/material.dart';

class CommandHistoryColumn extends StatelessWidget {
  final List<String> commandList;

  const CommandHistoryColumn({
    Key? key,
    required this.commandList,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Command history',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 50.0),
        if (commandList.isEmpty) const Text('Command history is empty'),
        for (int i = 0; i < commandList.length; i++)
          Text('${i + 1}. ${commandList[i]}'),
      ],
    );
  }
}