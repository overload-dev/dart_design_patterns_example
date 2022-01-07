import 'package:dart_design_patterns_example/pages/composite_pattern/components/i_file.dart';
import 'package:dart_design_patterns_example/pages/composite_pattern/utils/file_size_converter.dart';
import 'package:flutter/material.dart';

class File extends StatelessWidget implements IFile {
  final String title;
  final int size;
  final IconData icon;

  const File({
    Key? key,
    required this.title,
    required this.size,
    required this.icon,
  }) : super(key: key);

  @override
  int getSize() {
    return size;
  }

  @override
  Widget render(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10.0),
      child: ListTile(
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyText1,
        ),
        leading: Icon(icon),
        trailing: Text(
          FileSizeConverter.bytesToString(size),
          style: Theme.of(context)
              .textTheme
              .bodyText2
              !.copyWith(color: Colors.black54),
        ),
        dense: true,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return render(context);
  }
}
