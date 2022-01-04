import 'dart:convert';

import 'package:dart_design_patterns_example/pages/adapter_pattern/adapters/icontacts_adapter.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/data/json_contacts_api.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/models/contact.dart';

class JsonContactsAdapter extends IContactsAdapter {
  final JsonContactsApi _api = JsonContactsApi();

  @override
  List<Contact> getContacts() {
    String contactsJson = _api.getContactsJson();
    List<Contact> contactsList = _parseContactsJson(contactsJson);
    return contactsList;
  }

  List<Contact> _parseContactsJson(String contactsJson) {
    //String -> Json -> Map<String, dynamic>
    Map<String, dynamic> contactsMap =
        json.decode(contactsJson) as Map<String, dynamic>;

    //get List in Map
    List contactsJsonList = contactsMap['contacts'] as List;

    //convert json to model
    List<Contact> contactsList = contactsJsonList.map((json) {
      return Contact(
          fullName: json['fullName'],
          email: json['email'],
          favourite: json['favourite']);
    }).toList();

    return contactsList;
  }
}
