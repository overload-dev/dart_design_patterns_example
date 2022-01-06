import 'dart:convert';

import 'package:dart_design_patterns_example/pages/template_pattern/data/json_students_api.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/models/student.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/students_bmi_calculator.dart';
import 'package:flutter/foundation.dart';

class TeenageStudentsJsonBmiCalculator extends StudentsBmiCalculator {
  final JsonStudentsApi _api = JsonStudentsApi();

  @override
  @protected
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

  @override
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList
        .where((student) => student.age > 12 && student.age < 20)
        .toList();
  }
}
