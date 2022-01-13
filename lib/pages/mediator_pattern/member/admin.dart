import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';

class Admin extends TeamMember {
  Admin({required String name}) : super(name);

  @override
  String toString() {
    return "$name (Admin)";
  }
}
