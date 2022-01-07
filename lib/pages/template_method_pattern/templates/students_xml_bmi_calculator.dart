import 'package:dart_design_patterns_example/pages/template_method_pattern/data/xml_students_api.dart';
import 'package:dart_design_patterns_example/pages/template_method_pattern/models/student.dart';
import 'package:dart_design_patterns_example/pages/template_method_pattern/templates/students_bmi_calculator.dart';
import 'package:flutter/foundation.dart';
import 'package:xml/xml.dart';

class StudentsXmlBmiCalculator extends StudentsBmiCalculator {
  final XmlStudentsApi _api = XmlStudentsApi();

  @override
  @protected
  List<Student> getStudentsData() {
    String studentsXml = _api.getStudentsXml();
    var xmlDocument = XmlDocument.parse(studentsXml);
    List<Student> studentsList = [];

    for (var xmlElement in xmlDocument.findAllElements('student')) {
      String fullName = xmlElement.findElements('fullname').single.text;
      int age = int.parse(xmlElement.findElements('age').single.text);
      double height =
          double.parse(xmlElement.findElements('height').single.text);
      int weight = int.parse(xmlElement.findElements('weight').single.text);

      studentsList.add(Student(
        fullName: fullName,
        age: age,
        height: height,
        weight: weight,
      ));
    }
    return studentsList;
  }
}
