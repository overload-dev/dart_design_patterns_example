import 'package:dart_design_patterns_example/pages/adapter_pattern/models/contact.dart';

abstract class IContactsAdapter {
  List<Contact> getContacts();
}
