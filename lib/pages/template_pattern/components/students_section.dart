import 'package:dart_design_patterns_example/pages/template_pattern/components/students_data_table.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/models/student.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/students_bmi_calculator.dart';
import 'package:flutter/material.dart';

class StudentsSection extends StatefulWidget {
  final StudentsBmiCalculator bmiCalculator;
  final String headerText;

  const StudentsSection(
      {Key? key, required this.bmiCalculator, required this.headerText})
      : super(key: key);

  @override
  _StudentsSectionState createState() => _StudentsSectionState();
}

class _StudentsSectionState extends State<StudentsSection> {
  final List<Student> students = [];

  void _calculateBmiAndGetStudentsData() {

    setState(() {
      students.addAll(widget.bmiCalculator.calculateBmiAndReturnStudentList());
    });
    debugPrint(students.length.toString());

  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.headerText),
        const SizedBox(height: 15.0),
        Stack(
          children: [
            AnimatedOpacity(
              duration: const Duration(milliseconds: 500),
              opacity: students.isNotEmpty ? 1.0 : 0.0,
              child: StudentsDataTable(
                students: students,
              ),
            ),
            AnimatedOpacity(
              duration: const Duration(milliseconds: 250),
              opacity: students.isEmpty ? 1.0 : 0.0,
              child: ElevatedButton(
                onPressed: () {
                  _calculateBmiAndGetStudentsData();
                },
                child: const Text('Calculate BMI and get Students\' data'),
              )
            ),
          ],
        )
      ],
    );
  }
}
