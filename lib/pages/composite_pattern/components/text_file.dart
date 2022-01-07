import 'package:dart_design_patterns_example/pages/composite_pattern/components/file.dart';
import 'package:flutter/material.dart';

class TextFile extends File {
  const TextFile({Key? key, required String title, required int size})
      : super(key: key, title: title, size: size, icon: Icons.description);
}