import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:flutter/material.dart';

class LogMessage {
  final LogLevel logLevel;
  final String message;

  LogMessage({required this.logLevel, required this.message});

  String get _logLevelString =>
      logLevel.toString().split('.').last.toUpperCase();

  Color _getLogEntryColor() {
    switch (logLevel) {
      case LogLevel.Debug:
        return Colors.grey;
      case LogLevel.Info:
        return Colors.blue;
      case LogLevel.Error:
        return Colors.red;
      default:
        throw Exception("Log level '$logLevel' is not supported.");
    }
  }

  Widget getFormattedMessage() {
    return Text(
      '$_logLevelString: $message',
      style: TextStyle(
        color: _getLogEntryColor(),
      ),
      textAlign: TextAlign.justify,
      overflow: TextOverflow.ellipsis,
      maxLines: 2,
    );
  }
}
