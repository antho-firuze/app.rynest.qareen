import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:super_icons/super_icons.dart';

enum ButtonType { normal, google, apple }

enum IconPosition { left, top, right, bottom }

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.type = ButtonType.normal,
    this.busy = false,
    this.enabled = true,
    this.color,
    this.bgColor,
    this.minWidth,
    this.minHeight,
    this.tooltip,
    this.icon,
    this.child,
    this.flat = false,
    this.showBorder = true,
    this.onPressed,
    this.isRoundedEdges = false,
    this.isIconPositionStart = true,
    this.iconPosition = IconPosition.left,
  });

  final ButtonType type;
  final bool busy;
  final bool enabled;
  final Color? color;
  final Color? bgColor;
  final double? minWidth;
  final double? minHeight;
  final String? tooltip;
  final Icon? icon;
  final Widget? child;
  final bool flat;
  final bool showBorder;
  final bool isRoundedEdges;
  final bool isIconPositionStart;
  final IconPosition iconPosition;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    final onPressed = busy ? null : (enabled ? this.onPressed : null);
    final buttonStyleNormal = ElevatedButton.styleFrom(
      backgroundColor: bgColor,
      iconColor: color ?? oWhite,
      iconSize: 17,
      shape: showBorder == false
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(color: primaryLight),
              borderRadius: BorderRadius.circular(isRoundedEdges ? 30 : 10.0),
            ),
      // alignment: Alignment.center,
      // iconAlignment: IconAlignment.end,
      // textStyle: TextStyle(),
      // padding: isJumbo ? EdgeInsets.symmetric(vertical: 20.0) : EdgeInsets.symmetric(vertical: 10.0),
      padding: EdgeInsets.zero,
      minimumSize: Size(minWidth ?? 200, minHeight ?? 50),
      maximumSize: Size(minWidth ?? 200, minHeight ?? 60),
    );
    final buttonStyleFlat = ElevatedButton.styleFrom(
      foregroundColor: color ?? primaryLight.whenDark(oWhite, context),
      backgroundColor: bgColor ?? Colors.transparent,
      shadowColor: Colors.transparent,
      elevation: 0,
      shape: showBorder == false
          ? null
          : RoundedRectangleBorder(
              side: BorderSide(color: color ?? primaryLight),
              borderRadius: BorderRadius.circular(8.0),
            ),
      iconColor: primaryLight.whenDark(oWhite, context),
      iconSize: 17,
      padding: EdgeInsets.zero,
      minimumSize: Size(minWidth ?? 200, minHeight ?? 50),
      maximumSize: Size(minWidth ?? 200, minHeight ?? 60),
    );

    if (type == ButtonType.google) {
      return SizedBox(
        // width: context.isLandscape || context.isWidthScreen ? minWidth : minWidth ?? double.infinity,
        child: Tooltip(
          message: tooltip ?? "Log In dengan akun Google",
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyleFlat,
            child: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(SuperIcons.bs_google),
                      20.width,
                      Text('Log In dengan akun Google').tsButton().clr(oBlack.whenDark(oWhite, context)),
                    ],
                  ),
          ),
        ),
      );
    }

    if (type == ButtonType.apple) {
      return SizedBox(
        // width: context.isLandscape || context.isWidthScreen ? minWidth : minWidth ?? double.infinity,
        child: Tooltip(
          message: tooltip ?? "Log In dengan akun Apple",
          child: ElevatedButton(
            onPressed: onPressed,
            style: buttonStyleFlat.copyWith(iconColor: WidgetStatePropertyAll(oBlack.whenDark(oWhite, context))),
            child: busy
                ? const Padding(
                    padding: EdgeInsets.symmetric(vertical: 5),
                    child: CircularProgressIndicator(
                      strokeWidth: 5,
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                    ),
                  )
                : Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(SuperIcons.bs_apple),
                      20.width,
                      Text('Log In dengan akun Apple').tsButton().clr(oBlack.whenDark(oWhite, context)),
                    ],
                  ),
          ),
        ),
      );
    }

    if (icon != null && child != null) {
      if ([IconPosition.left, IconPosition.right].contains(iconPosition)) {
        return SizedBox(
          // width: context.isLandscape || context.isWidthScreen ? minWidth : minWidth ?? double.infinity,
          child: Tooltip(
            message: tooltip ?? "",
            child: ElevatedButton.icon(
              onPressed: onPressed,
              style: flat ? buttonStyleFlat : buttonStyleNormal,
              iconAlignment: iconPosition == IconPosition.left ? IconAlignment.start : IconAlignment.end,
              icon: icon!,
              label: busy
                  ? const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: CircularProgressIndicator(
                        strokeWidth: 5,
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                      ),
                    )
                  : child!,
            ),
          ),
        );
      } else {
        return SizedBox(
          // width: context.isLandscape || context.isWidthScreen ? minWidth : minWidth ?? double.infinity,
          child: Tooltip(
            message: tooltip ?? "",
            child: ElevatedButton(
              onPressed: onPressed,
              style: flat ? buttonStyleFlat : buttonStyleNormal,
              child: Column(
                spacing: 10,
                mainAxisSize: MainAxisSize.min,
                children: [
                  if (iconPosition == IconPosition.top) ...[icon!],
                  child!,
                  if (iconPosition == IconPosition.bottom) ...[icon!],
                ],
              ),
            ),
          ),
        );
      }
    }

    return SizedBox(
      // width: context.isLandscape || context.isWidthScreen ? minWidth : minWidth ?? double.infinity,
      child: Tooltip(
        message: tooltip ?? "",
        child: ElevatedButton(
          onPressed: onPressed,
          style: flat ? buttonStyleFlat : buttonStyleNormal,
          child: busy
              ? const Padding(
                  padding: EdgeInsets.symmetric(vertical: 5),
                  child: CircularProgressIndicator(
                    strokeWidth: 5,
                    valueColor: AlwaysStoppedAnimation<Color>(Colors.red),
                  ),
                )
              : icon != null && child == null
              ? icon
              : child,
        ),
      ),
    );
  }
}
