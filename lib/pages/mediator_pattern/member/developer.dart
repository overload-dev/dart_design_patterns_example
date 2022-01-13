import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';

class Developer extends TeamMember {
  Developer({required String name}) : super(name);

  @override
  String toString() {
    return "$name (Developer)";
  }
}
