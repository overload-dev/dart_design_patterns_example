import 'package:dart_design_patterns_example/training/theme_factory/interfaces/iappbar.dart';
import 'package:flutter/cupertino.dart';

class IOSAppBar implements IAppBar {
  @override
  String getTitle() {
    return 'IOS - App Bar';
  }

  @override
  Widget build({
    required BuildContext context,
    required Text title,
    required Widget? leading,
    required List<Widget> actions,
  }) {
    Widget actionWrap = Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        for (int i = 0; i < actions.length; i++)
        CupertinoButton(onPressed: (){},child:const Icon(CupertinoIcons.add))
      ],
    );



    return CupertinoNavigationBar(
      leading: leading,
      middle: title,
      trailing:
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            CupertinoButton(onPressed: (){},child:const Icon(CupertinoIcons.star)),
            CupertinoButton(onPressed: (){},child:const Icon(CupertinoIcons.add)),
          ],
        )
      ,
    );
  }
}
