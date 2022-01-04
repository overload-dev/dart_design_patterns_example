import 'package:dart_design_patterns_example/pages/adapter_pattern/adapters/icontacts_adapter.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/models/contact.dart';
import 'package:flutter/material.dart';

import 'contact_card.dart';

class ContactSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;

  const ContactSection({
    Key? key,
    required this.adapter,
    required this.headerText,
  }) : super(key: key);

  @override
  State<ContactSection> createState() => _ContactSectionState();
}

class _ContactSectionState extends State<ContactSection> {
  final List<Contact> contacts = [];

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
            widget.headerText,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,

          ),
        ),
        const SizedBox(height: 20.0),
        Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: contacts.isNotEmpty ? 1.0 : 0.0,
              child: Column(
                children: [
                  for (Contact contact in contacts)
                    ContactCard(contact: contact)
                ],
              ),
            ),
            AnimatedOpacity(duration: const Duration(milliseconds: 250),
              opacity: contacts.isEmpty ? 1.0 : 0.0,
              child: ElevatedButton(
                child: const Text('Get Contacts'),
                onPressed:  _getContacts,
              ),
            ),
          ],
        )
      ],
    );
  }
}
