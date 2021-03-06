import 'package:flutter/material.dart';

class CustomerInfoGroup extends StatelessWidget {
  final String label;
  final String text;

  const CustomerInfoGroup({
    Key? key,
    required this.label,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          label,
          style: Theme.of(context).textTheme.subtitle2,
        ),
        Text(
          text,
          style: Theme.of(context).textTheme.subtitle1,
        ),
      ],
    );
  }
}
