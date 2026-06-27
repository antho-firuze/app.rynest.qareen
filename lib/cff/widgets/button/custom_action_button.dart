import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/core/app_color.dart';

class CustomActionButton extends StatelessWidget {
  const CustomActionButton({
    super.key,
    this.tooltip,
    this.foregroundColor,
    this.backgroundColor,
    this.icon,
    this.child,
    this.flat = true,
    this.showBorder = true,
    this.forAppBar = true,
    this.onPressed,
  });

  final String? tooltip;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Icon? icon;
  final Widget? child;
  final bool flat;
  final bool showBorder;
  final bool forAppBar;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // ONLY ICON
    if (icon != null && child == null) {
      final _btnAppBarStyle = TextButton.styleFrom(
        foregroundColor: oWhite,
        backgroundColor: backgroundColor ?? Colors.transparent,
        iconColor: oWhite,
        shadowColor: Colors.transparent,
        elevation: 0,
        padding: EdgeInsets.zero,
      );
      final _btnStyleNormal = IconButton.styleFrom(
        foregroundColor: foregroundColor ?? oWhite,
        backgroundColor: backgroundColor ?? primaryLight,
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        // iconSize: 17,
      );
      final _btnStyleFlat = IconButton.styleFrom(
        foregroundColor: primaryLight.whenDark(oWhite, context),
        backgroundColor: backgroundColor ?? Colors.transparent,
        shadowColor: Colors.transparent,
        elevation: 0,
        shape: showBorder == false ? null : CircleBorder(side: BorderSide(color: primaryLight)),
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        // iconSize: 17,
      );
      return Tooltip(
        message: tooltip ?? "",
        child: IconButton(
          onPressed: onPressed,
          style: forAppBar ? _btnAppBarStyle : (flat ? _btnStyleFlat : _btnStyleNormal),
          icon: icon!,
        ),
      );
    }

    final _btnAppBarStyle = TextButton.styleFrom(
      foregroundColor: oWhite,
      backgroundColor: backgroundColor ?? Colors.transparent,
      iconColor: oWhite,
      shadowColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
    final _btnStyleNormal = TextButton.styleFrom(
      foregroundColor: foregroundColor ?? oWhite,
      backgroundColor: backgroundColor ?? primaryLight.whenDark(Colors.transparent, context),
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
    );
    final _btnStyleFlat = TextButton.styleFrom(
      foregroundColor: primaryLight.whenDark(oWhite, context),
      backgroundColor: backgroundColor ?? Colors.transparent,
      iconColor: primaryLight.whenDark(oWhite, context),
      shadowColor: Colors.transparent,
      elevation: 0,
      padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
      shape: showBorder == false
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(color: primaryLight),
              borderRadius: BorderRadius.circular(28.0),
            ),
    );

    // ICON & TEXT
    if (icon != null && child != null) {
      return Tooltip(
        message: tooltip ?? "",
        child: TextButton.icon(
          onPressed: onPressed,
          style: forAppBar ? _btnAppBarStyle : (flat ? _btnStyleFlat : _btnStyleNormal),
          iconAlignment: IconAlignment.start,
          icon: icon!,
          label: child ?? SizedBox(),
        ),
      );
    }

    // ONLY TEXT
    return Tooltip(
      message: tooltip ?? "",
      child: TextButton(
        onPressed: onPressed,
        style: forAppBar ? _btnAppBarStyle : (flat ? _btnStyleFlat : _btnStyleNormal),
        child: child ?? SizedBox(),
      ),
    );
  }
}
