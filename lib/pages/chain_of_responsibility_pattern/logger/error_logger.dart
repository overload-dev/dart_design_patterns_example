import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_level.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/logger_base.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/services/mail_service.dart';

class ErrorLogger extends LoggerBase {
  late MailService mailService;

  ErrorLogger(LogBloc logBloc, [LoggerBase? nextLogger])
      : super(LogLevel.Error, nextLogger) {
    mailService = MailService(logBloc);
  }

  @override
  void log(String message) {
    mailService.sendErrorMail(logLevel, message);
  }
}
