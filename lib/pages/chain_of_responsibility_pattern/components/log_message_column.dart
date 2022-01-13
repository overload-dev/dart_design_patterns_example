import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_message.dart';
import 'package:flutter/material.dart';

class LogMessageColumn extends StatelessWidget {
  final List<LogMessage> logMessages;

  const LogMessageColumn({
    Key? key,
    required this.logMessages,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        for (var logMessage in logMessages)
          Row(
            children: <Widget>[
              Expanded(
                child: logMessage.getFormattedMessage(),
              ),
            ],
          )
      ],
    );
  }
}
