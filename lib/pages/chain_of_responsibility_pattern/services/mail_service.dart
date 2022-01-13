import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_message.dart';

class MailService {
  final LogBloc logBloc;

  MailService(this.logBloc);

  void sendErrorMail(LogLevel logLevel, String message) {
    var logMessage = LogMessage(logLevel: logLevel, message: message);
    logBloc.log(logMessage);
  }
}
