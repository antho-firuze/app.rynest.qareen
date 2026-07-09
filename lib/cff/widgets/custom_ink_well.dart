import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class CustomInkWell extends StatelessWidget {
  const CustomInkWell({
    super.key,
    this.tooltip,
    this.onTap,
    this.text,
    this.radius = 12,
    this.color,
    this.isCircle = false,
    this.icon,
    this.isIconPositionStart = false,
  });

  final String? tooltip;
  final void Function()? onTap;
  final Widget? text;
  final Widget? icon;
  final bool isIconPositionStart;
  final double radius;
  final Color? color;
  final bool isCircle;

  @override
  Widget build(BuildContext context) {
    return Tooltip(
      message: tooltip ?? '',
      child: InkWell(
        onTap: onTap,
        child: Row(
          children: [
            if (isIconPositionStart == true && icon != null) ...[(icon as Icon).clr(Colors.green[600])],
            (text as Text).clr(Colors.green[600]),
            if (isIconPositionStart == false && icon != null) ...[(icon as Icon).clr(Colors.green[600])],
          ],
        ),
      ),
    );
  }
}
