import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class CustomDialog extends StatelessWidget {
  const CustomDialog({super.key, this.leading, this.title, this.content, this.actions});

  final Widget? leading;
  final Widget? title;
  final Widget? content;
  final List<Widget>? actions;

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
      child: AlertDialog.adaptive(
        shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
        contentPadding: EdgeInsets.fromLTRB(25, 20, 25, 20),
        actionsPadding: const EdgeInsets.fromLTRB(20, 0, 20, 15),
        actionsAlignment: MainAxisAlignment.spaceBetween,
        title: Row(
          children: [
            if (leading != null) ...[leading!, 10.width],
            if (title != null) Expanded(child: title!),
          ],
        ),
        content: content,
        actions: actions,
      ),
    );
  }
}
