import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_message.dart';

class ExternalLoggingService {
  final LogBloc logBloc;

  ExternalLoggingService(this.logBloc);

  void logMessage(LogLevel logLevel, String message) {
    var logMessage = LogMessage(logLevel: logLevel, message: message);
    logBloc.log(logMessage);
  }
}
