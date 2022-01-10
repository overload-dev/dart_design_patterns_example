import 'package:dart_design_patterns_example/pages/factory_method_pattern/factories/custom_dialog.dart';
import 'package:flutter/material.dart';

class DialogSelection extends StatelessWidget {
  final List<CustomDialog> customDialogList;
  final int selectedIndex;
  final ValueSetter<int?> onChanged;

  const DialogSelection({
    Key? key,
    required this.customDialogList,
    required this.selectedIndex,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int i = 0; i < customDialogList.length; i++)
          RadioListTile(
            title: Text(customDialogList[i].getTitle()),
            value: i,
            groupValue: selectedIndex,
            activeColor: Colors.black,
            controlAffinity: ListTileControlAffinity.platform,
            onChanged: onChanged,
          )
      ],
    );
  }
}
