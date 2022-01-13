import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_message.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/logger_base.dart';

class DebugLogger extends LoggerBase {
  final LogBloc logBloc;

  const DebugLogger(this.logBloc, [LoggerBase? nextLogger])
      : super(LogLevel.Debug, nextLogger);

  @override
  void log(String message) {
    var logMessage = LogMessage(logLevel: logLevel, message: message);
    logBloc.log(logMessage);
  }
}
