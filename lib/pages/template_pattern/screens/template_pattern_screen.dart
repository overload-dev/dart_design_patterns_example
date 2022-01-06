import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/components/students_section.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/students_json_bmi_calculator.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/students_xml_bmi_calculator.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/templates/teenage_students_json_bim_calculator.dart';
import 'package:flutter/material.dart';

class TemplatePatternScreen extends StatelessWidget {
  static String routeName = '/template_patten_screen';

  const TemplatePatternScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(title: 'Template Pattern Example'),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StudentsSection(
                bmiCalculator: StudentsXmlBmiCalculator(),
                headerText: 'Students from XML data source:',
              ),
              const SizedBox(height: 20.0),
              StudentsSection(
                bmiCalculator: StudentsJsonBmiCalculator(),
                headerText: 'Students from Json data source:',
              ),
              const SizedBox(height: 20.0),
              StudentsSection(
                bmiCalculator: TeenageStudentsJsonBmiCalculator(),
                headerText: 'Students from JSON data Source (teenagers only):',
              )
            ],
          ),
        ),
      ),
    );
  }
}
