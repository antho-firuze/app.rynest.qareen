import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_dialog.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CustomDropdownDialog<T> extends StatefulWidget {
  const CustomDropdownDialog({super.key, this.title, this.groupValue, required this.keys, required this.values});

  final Widget? title;
  final T? groupValue;
  final List<String> keys;
  final List<T> values;

  @override
  State<CustomDropdownDialog> createState() => _CustomDropdownDialogState();
}

class _CustomDropdownDialogState<T> extends State<CustomDropdownDialog> {
  T? selectedValue;

  @override
  void initState() {
    selectedValue = widget.groupValue;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      title: widget.title,
      content: RadioGroup(
        groupValue: selectedValue,
        onChanged: (val) => setState(() => selectedValue = val as T),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: List.generate(widget.values.length, (index) {
            final k = widget.keys[index];
            final v = widget.values[index] as T;
            return RadioListTile(contentPadding: EdgeInsets.zero, title: Text(k).bold(), value: v);
          }),
        ),
      ),
      actions: [
        CustomButton(
          child: const Text('OK'),
          onPressed: () {
            context.pop(selectedValue);
          },
        ),
      ],
    );
  }
}
