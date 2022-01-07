import 'package:dart_design_patterns_example/pages/template_method_pattern/models/student.dart';
import 'package:flutter/material.dart';

class StudentsDataTable extends StatelessWidget {
  final List<Student> students;
  const StudentsDataTable({Key? key, required this.students}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DataTable(
        columns: const [
          DataColumn(label: Text('fullName')),
          DataColumn(label: Text('age')),
          DataColumn(label: Text('height')),
          DataColumn(label: Text('weight')),
          DataColumn(label: Text('bmi')),
        ],
        rows: List.generate(students.length, (index){
          return DataRow(cells: [
            DataCell(Text(students[index].fullName)),
            DataCell(Text(students[index].age.toString())),
            DataCell(Text(students[index].height.toString())),
            DataCell(Text(students[index].weight.toString())),
            DataCell(Text(students[index].bmi.toString())),
          ]);
        }),
    );
  }
}
