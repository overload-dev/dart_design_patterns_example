import 'package:dart_design_patterns_example/pages/template_pattern/models/student.dart';
import 'package:flutter/foundation.dart';
import "dart:math";

abstract class StudentsBmiCalculator {
  // 변경 불가, 클래스를 상속 받는 모든 클래스는 동일하게 사용해야한다.
  List<Student> calculateBmiAndReturnStudentList() {
    var studentList = getStudentsData();
    studentList = doStudentsFiltering(studentList);
    _calculateStudentsBmi(studentList);
    return studentList;
  }

  // 변경 불가,
  void _calculateStudentsBmi(List<Student> studentList) {
    for (var student in studentList) {
      student.bmi = _calculateBmi(student.height, student.weight);
    }
  }

  //private methods
  double _calculateBmi(double height, int weight) {
    return weight / pow(height, 2);
  }

  //hook methods
  @protected
  List<Student> doStudentsFiltering(List<Student> studentList) {
    return studentList;
  }

  //abstract methods
  @protected
  List<Student> getStudentsData();
}
