import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';

class GroupList extends StatelessWidget {
  const GroupList({
    super.key,
    this.title,
    this.fgColor,
    this.bgColor,
    this.showDividerTop = false,
    this.showDividerBottom = false,
    this.showDividerCenter = false,
    this.actions,
    this.children,
    this.padding,
    this.onTap,
    this.trailing,
  });

  final bool showDividerTop;
  final bool showDividerBottom;
  final bool showDividerCenter;
  final EdgeInsetsGeometry? padding;
  final Widget? title;
  final Color? fgColor;
  final Color? bgColor;
  final IconData? trailing;
  final List<Widget>? actions;
  final List<Widget>? children;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    //       if (actions != null)
    //         Expanded(
    //           child: Row(
    //             mainAxisAlignment: MainAxisAlignment.end,
    //             children: actions!.reversed.toList(),
    //           ),
    //         ),
    Widget? _actions = actions == null
        ? SizedBox()
        : Row(mainAxisAlignment: MainAxisAlignment.end, children: actions!.toList());
    Widget? _title = Row(
      children: [
        Expanded(child: title == null ? SizedBox() : (title! as Text).tsTitle().clr(fgColor).bold()),
        _actions,
      ],
    );
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (showDividerTop) Padding(padding: const EdgeInsets.only(bottom: 10.0), child: divider()),
        if (showDividerCenter)
          Stack(
            alignment: Alignment.centerLeft,
            children: [
              divider(),
              Container(
                padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                color: Theme.of(context).scaffoldBackgroundColor,
                child: _title,
              ),
              divider(),
            ],
          )
        else
          Container(padding: EdgeInsets.fromLTRB(20, 5, 10, 0), child: _title),

        if (showDividerBottom) Padding(padding: const EdgeInsets.only(top: 10.0), child: divider()),
        if (children != null) ...[...children!],
      ],
    );
  }
}
