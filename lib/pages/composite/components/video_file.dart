import 'package:dart_design_patterns_example/pages/composite/components/file.dart';
import 'package:flutter/material.dart';

class VideoFile extends File {
  const VideoFile({Key? key, required String title, required int size})
      : super(key: key, title: title, size: size, icon: Icons.movie);
}
