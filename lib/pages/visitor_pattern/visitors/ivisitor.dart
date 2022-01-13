import 'package:dart_design_patterns_example/pages/visitor_pattern/files/audio_file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/files/directory.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/files/image_file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/files/text_file.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/files/video_file.dart';

abstract class IVisitor {
  String getTitle();

  String visitAudioFile(AudioFile file);

  String visitImageFile(ImageFile file);

  String visitTextFile(TextFile file);

  String visitVideoFile(VideoFile file);

  String visitDirectory(Directory file);
}
