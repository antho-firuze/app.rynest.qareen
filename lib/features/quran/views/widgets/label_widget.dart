import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class LabelWidget extends StatelessWidget {
  const LabelWidget({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        border: Border.all(color: Colors.grey),
      ),
      child: Text('${title}').tsBody().bold(),
    );
  }
}
