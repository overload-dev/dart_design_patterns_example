import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/screens/adapter_patern_screen.dart';
import 'package:dart_design_patterns_example/pages/template_pattern/screens/template_pattern_screen.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  MainScreen({Key? key}) : super(key: key);

  final List<Map<String, String>> routes = [
    {
      'title': '01.\nAdapter Pattern Example',
      'routeName': AdapterPatternScreen.routeName,
    },
    {
      'title': '02\nTemplate Method Exampel',
      'routeName': TemplatePatternScreen.routeName,
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Main',
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
        itemCount: routes.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () => Navigator.pushNamed(context, routes[index]['routeName'] as String),
            child: _buildItemCard(
              context: context,
              title: routes[index]['title'] as String,
            ),
          );
        },
      ),
    );
  }

  _buildItemCard({
    required BuildContext context,
    required String title,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(5.0),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
          height: 100.0,
          color: Colors.black,
          child: Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 20.0,
            ),
            maxLines: 3,
          ),
        ),
      ),
    );
  }
}
