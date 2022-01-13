import 'package:dart_design_patterns_example/pages/visitor_pattern/files/file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:flutter/material.dart';

class VideoFile extends File {
  final String directedBy;

  const VideoFile(String title, this.directedBy, String fileExtension, int size,
      {Key? key})
      : super(title, fileExtension, size, Icons.movie, key: key);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitVideoFile(this);
  }
}
