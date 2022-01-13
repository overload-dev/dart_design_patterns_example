import 'package:dart_design_patterns_example/pages/visitor_pattern/files/index.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/utils/file_size_converter.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/visitors/ivisitor.dart';
import 'package:dart_design_patterns_example/pages/visitor_pattern/extensions/format_extensions.dart';

class XmlVisitor implements IVisitor {
  @override
  String getTitle() => 'Export as XML';

  @override
  String visitAudioFile(AudioFile file) {
    Map<String, String> fileInfo = {
      'title': file.title,
      'album': file.albumTitle,
      'extension': file.fileExtension,
      'size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile(file.title, fileInfo);
  }

  @override
  String visitDirectory(Directory directory) {
    bool isRootDirectory = directory.level == 0;

    String directoryText = isRootDirectory ? '<files>\n' : '';

    for (var file in directory.files) {
      directoryText += file.accept(this);
    }
    return isRootDirectory ? '$directoryText</files>\n' : directoryText;
  }

  @override
  String visitImageFile(ImageFile file) {
    Map<String, String> fileInfo = {
      'title': file.title,
      'resolution': file.resolution,
      'extension': file.fileExtension,
      'size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile('image', fileInfo);
  }

  @override
  String visitTextFile(TextFile file) {
    String fileContentPreview = file.content.length > 30
        ? '${file.content.substring(0, 30)}...'
        : file.content;

    Map<String, String> fileInfo = {
      'title': file.title,
      'preview': fileContentPreview,
      'extension': file.fileExtension,
      'size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile('text', fileInfo);
  }

  @override
  String visitVideoFile(VideoFile file) {
    Map<String, String> fileInfo = {
      'title': file.title,
      'directed_by': file.directedBy,
      'extension': file.fileExtension,
      'size': FileSizeConverter.bytesToString(file.getSize()),
    };

    return _formatFile('video', fileInfo);
  }

  String _formatFile(String type, Map<String, String> fileInfo) {
    String formattedFile = '<$type>'.indentAndAddNewLine(2);

    for (var entry in fileInfo.entries) {
      formattedFile +=
          '<${entry.key}>${entry.value}</${entry.key}>'.indentAndAddNewLine(4);
    }

    formattedFile += '</$type>'.indentAndAddNewLine(2);

    return formattedFile;
  }
}
