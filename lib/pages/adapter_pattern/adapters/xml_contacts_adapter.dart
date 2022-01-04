import 'package:xml/xml.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/adapters/icontacts_adapter.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/data/xml_contacts_api.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/models/contact.dart';

class XmlContactsAdapter implements IContactsAdapter {
  final XmlContactsApi _api = XmlContactsApi();

  @override
  List<Contact> getContacts() {
    String contactXml = _api.getContactsXml();
    var contactsList = _parseContactsXml(contactXml);

    return contactsList;
  }

  List<Contact> _parseContactsXml(String contactXml) {
    XmlDocument xmlDocument = XmlDocument.parse(contactXml);
    List<Contact> contactsList = [];

    for (XmlElement xmlElement in xmlDocument.findAllElements('contact')) {
      String fullName = xmlElement.findElements('fullname').single.text;
      String email = xmlElement.findElements('email').single.text;
      String favouriteString = xmlElement.findElements('favourite').single.text;
      bool favourite = favouriteString.toLowerCase() == 'true';

      contactsList.add(Contact(
        fullName: fullName,
        email: email,
        favourite: favourite,
      ));
    }

    return contactsList;
  }
}
