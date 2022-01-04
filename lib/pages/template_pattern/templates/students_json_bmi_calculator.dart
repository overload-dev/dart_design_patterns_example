import 'dart:convert';

import 'package:dart_design_patterns_example/pages/template_pattern/data/json_students_api.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/models/student.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/students_bmi_calculator.dart';

class StudentsJsonBmiCalculator extends StudentsBmiCalculator {
  final JsonStudentsApi _api = JsonStudentsApi();

  @override
  List<Student> getStudentsData() {
    String studentsJson = _api.getStudentsJson();
    Map<String, dynamic> studentsMap =
        json.decode(studentsJson) as Map<String, dynamic>;
    List studentsJsonList = studentsMap['students'] as List;

    List<Student> studentsList = studentsJsonList
        .map((json) => Student(
              fullName: json['fullName'],
              age: json['age'],
              height: json['height'],
              weight: json['weight'],
            ))
        .toList();
    return studentsList;
  }
}
