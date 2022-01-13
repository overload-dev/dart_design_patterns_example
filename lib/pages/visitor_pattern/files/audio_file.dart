import 'package:dart_design_patterns_example/pages/visitor_pattern/files/file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:flutter/material.dart';

class AudioFile extends File {
  final String albumTitle;

  const AudioFile(String title, this.albumTitle, String fileExtension, int size,
      {Key? key})
      : super(title, fileExtension, size, Icons.music_note, key: key);

  @override
  String accept(IVisitor visitor) {
    return visitor.visitAudioFile(this);
  }
}
