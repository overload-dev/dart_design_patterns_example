import 'package:dart_design_patterns_example/pages/visitor_pattern/files/file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:flutter/material.dart';

class ImageFile extends File {
  final String resolution;

  const ImageFile(String title, this.resolution, String fileExtension, int size,
      {Key? key})
      : super(title, fileExtension, size, Icons.image, key: key);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitImageFile(this);
  }
}

