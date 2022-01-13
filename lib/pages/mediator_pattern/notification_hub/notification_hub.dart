import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';

abstract class NotificationHub {
  List<TeamMember> getTeamMembers();

  void register(TeamMember member);

  void send(TeamMember sender, String message);

  void sendTo<T extends TeamMember>(TeamMember sender, String message);
}
