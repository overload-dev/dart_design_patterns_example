import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';
import 'package:dart_design_patterns_example/pages/mediator_pattern/notification_hub/notification_hub.dart';

class TeamNotificationHub extends NotificationHub {
  final List<TeamMember> _teamMembers = [];

  TeamNotificationHub({List<TeamMember>? members}) {
    members?.forEach(register);
  }

  @override
  List<TeamMember> getTeamMembers() => _teamMembers;

  @override
  void register(TeamMember member) {
    member.notificationHub = this;
    _teamMembers.add(member);
  }

  @override
  void send(TeamMember sender, String message) {
    final filteredMembers = _teamMembers.where((m) => m != sender);

    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }

  @override
  void sendTo<T extends TeamMember>(TeamMember sender, String message) {
    final filteredMembers =
        _teamMembers.where((m) => m != sender).whereType<T>();

    for (final member in filteredMembers) {
      member.receive(sender.toString(), message);
    }
  }
}
