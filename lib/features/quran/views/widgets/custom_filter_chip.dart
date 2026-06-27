import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class CustomFilterChip extends StatelessWidget {
  const CustomFilterChip({super.key, required this.label, required this.selected, this.onSelected});

  final Widget label;
  final bool selected;
  final void Function(bool)? onSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: (label as Text).tsBody().bold(),
    );
  }
}
