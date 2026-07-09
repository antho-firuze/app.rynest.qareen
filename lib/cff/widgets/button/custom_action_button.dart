import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:super_icons/super_icons.dart';

enum ActionType { search, back, favourite, notification }

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
    this.hasNotif = false,
    this.actionType,
    this.invertColor = false,
  });

  final String? tooltip;
  final Color? foregroundColor;
  final Color? backgroundColor;
  final Icon? icon;
  final Widget? child;
  final bool flat;
  final bool showBorder;
  final bool forAppBar;
  final bool hasNotif;
  final void Function()? onPressed;
  final ActionType? actionType;
  final bool invertColor;

  @override
  Widget build(BuildContext context) {
    // ONLY ICON
    if (child == null && (icon != null || actionType != null)) {
      // final _btnAppBarStyle = TextButton.styleFrom(
      //   foregroundColor: oWhite,
      //   backgroundColor: backgroundColor ?? Colors.transparent,
      //   iconColor: oWhite,
      //   shadowColor: Colors.transparent,
      //   elevation: 0,
      //   padding: EdgeInsets.zero,
      // );
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
      var _icon = icon;
      if (actionType != null) {
        _icon = switch (actionType) {
          ActionType.back => Icon(Icons.chevron_left, color: invertColor ? oBlack.whenDark(oWhite) : oWhite, size: 35),
          ActionType.notification => Icon(
            SuperIcons.cl_bell_line,
            color: invertColor ? oBlack.whenDark(oWhite) : oWhite,
            size: 30,
          ),
          _ => icon,
        };
      }
      return Stack(
        children: [
          Tooltip(
            message: tooltip ?? "",
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                onPressed: onPressed,
                style: forAppBar ? null : (flat ? _btnStyleFlat : _btnStyleNormal),
                icon: _icon!,
              ),
            ),
          ),
          if (hasNotif)
            Positioned(
              right: 20,
              top: 18,
              child: SizedBox(
                width: 9,
                height: 9,
                child: Container(
                  decoration: BoxDecoration(color: oRed50, shape: BoxShape.circle),
                ),
              ),
            ),
        ],
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
