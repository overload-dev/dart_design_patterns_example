import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/components/log_message_column.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_bloc.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/log/log_message.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/debug_logger.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/error_logger.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/info_logger.dart';
import 'package:dart_design_patterns_example/pages/chain_of_responsibility_pattern/logger/logger_base.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class ChainOfResponsibilityScreen extends StatefulWidget {
  static String routeName = '/chain_of_responsibility_screen';

  const ChainOfResponsibilityScreen({Key? key}) : super(key: key);

  @override
  _ChainOfResponsibilityScreenState createState() =>
      _ChainOfResponsibilityScreenState();
}

class _ChainOfResponsibilityScreenState
    extends State<ChainOfResponsibilityScreen> {
  final LogBloc logBloc = LogBloc();
  late final LoggerBase logger;

  @override
  void initState() {
    super.initState();
    logger = DebugLogger(
      logBloc,
      InfoLogger(
        logBloc,
        ErrorLogger(
          logBloc,
        ),
      ),
    );
  }

  @override
  void dispose() {
    logBloc.dispose();
    super.dispose();
  }

  String get randomLog => faker.lorem.sentence();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Chain Of Responsibility Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              PlatformButton(
                child: const Text('Log debug'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: () {
                  logger.logDebug(randomLog);
                },
              ),
              PlatformButton(
                child: const Text('Log info'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: () {
                  logger.logInfo(randomLog);
                },
              ),
              PlatformButton(
                child: const Text('Log error'),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: () => logger.logError(randomLog),
              ),
              const Divider(),
              Row(
                children: [
                  Expanded(
                    child: StreamBuilder<List<LogMessage>>(
                      initialData: [],
                      stream: logBloc.outLogStream,
                      builder: (_, AsyncSnapshot<List<LogMessage>> snapshot) =>
                          LogMessageColumn(logMessages: snapshot.data!),
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
