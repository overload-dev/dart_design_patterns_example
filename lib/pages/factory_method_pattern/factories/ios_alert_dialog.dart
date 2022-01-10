import 'package:dart_design_patterns_example/pages/factory_method_pattern/factories/custom_dialog.dart';
import 'package:flutter/cupertino.dart';

class IosAlertDialog extends CustomDialog {
  @override
  String getTitle() {
    return 'iOS Alert Dialog';
  }

  @override
  Widget create(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(getTitle()),
      content: const Text('This is cupertino-style alert dialog!'),
      actions: [
        CupertinoButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}
