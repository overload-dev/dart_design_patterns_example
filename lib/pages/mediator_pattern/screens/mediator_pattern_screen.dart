import 'package:dart_design_patterns_example/components/platform_button.dart';
import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/components/notification_list.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/member/admin.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/member/developer.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/member/tester.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/notification_hub/notification_hub.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/notification_hub/team_notification_hub.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';

class MediatorPatternScreen extends StatefulWidget {
  static String routeName = '/mediator_pattern_screen';

  const MediatorPatternScreen({Key? key}) : super(key: key);

  @override
  _MediatorPatternScreenState createState() => _MediatorPatternScreenState();
}

class _MediatorPatternScreenState extends State<MediatorPatternScreen> {
  late final NotificationHub _notificationHub;

  final _admin = Admin(name: 'God');

  @override
  void initState() {
    super.initState();

    final _members = [
      _admin,
      Developer(name: 'Sea Sharp'),
      Developer(name: 'Jan Assembler'),
      Developer(name: 'Dov Dart'),
      Tester(name: 'Cori Debugger'),
      Tester(name: 'Tania Mocha'),
    ];

    _notificationHub = TeamNotificationHub(members: _members);
  }

  void _sendToAll() {
    setState(() {
      _admin.send('Hello');
    });
  }

  void _sendToQa() {
    setState(() {
      _admin.sendTo<Tester>('Bug!');
    });
  }

  void _sendToDevelopers() {
    setState(() {
      _admin.sendTo<Developer>('Hello, World!');
    });
  }

  void _addTeamMember() {
    final name = '${faker.person.firstName()} ${faker.person.lastName()}';
    final teamMember = faker.randomGenerator.boolean()
        ? Tester(name: name)
        : Developer(name: name);

    setState(() {
      _notificationHub.register(teamMember);
    });
  }

  void _sendFromMember(TeamMember member) {
    setState(() {
      member.send('Hello from ${member.name}');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Mediator Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(
            horizontal: 15.0,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              PlatformButton(
                child: const Text("Admin: Send 'Hello' to all"),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _sendToAll,
              ),
              PlatformButton(
                child: const Text("Admin: Send 'BUG!' to QA"),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _sendToQa,
              ),
              PlatformButton(
                child: const Text("Admin: Send 'Hello, World!' to Developers"),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _sendToDevelopers,
              ),
              const Divider(),
              PlatformButton(
                child: const Text("Add team member"),
                materialColor: Colors.black,
                materialTextColor: Colors.white,
                onPressed: _addTeamMember,
              ),
              const SizedBox(height: 25.0),
              NotificationList(
                members: _notificationHub.getTeamMembers(),
                onTap: _sendFromMember,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
