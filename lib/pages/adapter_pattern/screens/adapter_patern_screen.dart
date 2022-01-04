import 'package:dart_design_patterns_example/components/project_app_bar.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/adapters/json_contacts_adapter.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/adapters/xml_contacts_adapter.dart';
import 'package:dart_design_patterns_example/pages/adapter_pattern/components/contacts_section.dart';
import 'package:flutter/material.dart';

class AdapterPatternScreen extends StatelessWidget {
  static String routeName = '/adapter_pattern_screen';

  const AdapterPatternScreen({Key? key}) : super(key: key);

  // Adapter Design Pattern
  // code - [adapters] - library
  // 내부 코드와 외부 라이브러리 및 데이터 형태가 1대1로 호환되지 않을 경우
  // 중계자(adapters)를 두어 코드와 외부의 라이브러리 및 데이터 형태가 호환되도록 하는 패턴
  // (Object Adapter)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: ProjectAppBar(
          title: 'Adapter Pattern Example',
        ),
      ),
      body: ScrollConfiguration(
        behavior: const ScrollBehavior(),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ContactSection(
                adapter: JsonContactsAdapter(),
                headerText: "Contacts from JSON API",
              ),
              const SizedBox(height: 50),
              ContactSection(
                adapter: XmlContactsAdapter(),
                headerText: "Contacts from XML API",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
