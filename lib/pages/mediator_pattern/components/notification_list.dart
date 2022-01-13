import 'package:dart_design_patterns_example/pages/mediator_pattern/member/team_member.dart';
import 'package:flutter/material.dart';

class NotificationList extends StatelessWidget {
  final List<TeamMember> members;
  final ValueSetter<TeamMember> onTap;

  const NotificationList({
    Key? key,
    required this.members,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Last notifications',
          style: Theme.of(context).textTheme.headline6,
        ),
        const SizedBox(height: 15.0),
        Text(
          'Note: click on the card to send a notification from the team member.',
          style: Theme.of(context).textTheme.caption,
        ),
        const SizedBox(height: 15.0),
        for (final member in members)
          Card(
            margin: const EdgeInsets.symmetric(
              vertical: 15.0,
            ),
            child: InkWell(
              onTap: () => onTap(member),
              child: Container(
                padding: const EdgeInsets.symmetric(
                  vertical: 15.0,
                  horizontal: 25.0,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            member.toString(),
                            style: const TextStyle(fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(height: 10.0),
                          Text(member.lastNotification ?? '-'),
                        ],
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.only(left: 15.0),
                      child: Icon(Icons.message),
                    ),
                  ],
                ),
              ),
            ),
          )
      ],
    );
  }
}
