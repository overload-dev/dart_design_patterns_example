import 'package:dart_design_patterns_example/pages/composite_pattern/components/file.dart';
import 'package:flutter/material.dart';

class ImageFile extends File {
  const ImageFile({Key? key, required String title, required int size})
      : super(key: key, title: title, size: size, icon: Icons.image);
}
