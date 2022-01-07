import 'package:dart_design_patterns_example/pages/composite_pattern/components/i_file.dart';
import 'package:dart_design_patterns_example/pages/composite_pattern/utils/file_size_converter.dart';
import 'package:flutter/material.dart';

class Directory extends StatelessWidget implements IFile {
  final String title;
  final bool isInitiallyExpanded;
  final List<IFile> files = [];

  Directory({
    Key? key,
    required this.title,
    this.isInitiallyExpanded = false,
  }) : super(key: key);

  void addFile(IFile file) {
    files.add(file);
  }

  @override
  int getSize() {
    var sum = 0;
    for (var file in files) {
      sum += file.getSize();
    }
    return sum;
  }

  @override
  Widget render(BuildContext context) {
    return Theme(
      data: ThemeData(
        colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 15.0),
        child: ExpansionTile(
          leading: const Icon(Icons.folder),
          title: Text('$title (${FileSizeConverter.bytesToString(getSize())})'),
          children: files.map((IFile file) => file.render(context)).toList(),
          initiallyExpanded: isInitiallyExpanded,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
