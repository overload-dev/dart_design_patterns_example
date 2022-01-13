import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/logger_base.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/services/external_logging_service.dart';

class InfoLogger extends LoggerBase {
  late ExternalLoggingService externalLoggingService;

  InfoLogger(LogBloc logBloc, [LoggerBase? nextLogger])
      : super(LogLevel.Info, nextLogger) {
    externalLoggingService = ExternalLoggingService(logBloc);
  }

  @override
  void log(String message) {
    externalLoggingService.logMessage(logLevel, message);
  }
}
