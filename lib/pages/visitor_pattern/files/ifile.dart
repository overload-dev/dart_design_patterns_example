import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:flutter/material.dart';

abstract class IFile {
  int getSize();
  Widget render(BuildContext context);
  String accept(IVisitor visitor);

}