import 'package:dart_design_patterns_example/pages/adapter_pattern/models/contact.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  final Contact contact;

  const ContactCard({Key? key, required this.contact}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      margin: const EdgeInsets.all(10.0),
      height: 120,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5.0),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.5),
                offset: const Offset(5, 5),
                blurRadius: 5.0,
                spreadRadius: 5.0)
          ]),
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 60,
              width: 60,
              child: CircleAvatar(
                child: Text(
                  contact.fullName[0],
                  style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                backgroundColor: Colors.grey,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  contact.fullName,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),
                ),
                Text(
                  contact.email,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18.0
                  ),
                ),
              ],
            )
          ),
          Expanded(
            flex: 2,
            child: Icon(
              contact.favourite ? Icons.grade : Icons.grade_outlined,
              color: Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
