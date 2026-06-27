import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/router.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:qareen/main.dart';

enum SnackbarPosition { middle, bottom }

class SnackBarService {
  static void show({required String message, Duration duration = const Duration(seconds: 2)}) {
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(SnackBar(duration: duration, content: Text(message).tsBody()));
  }

  const SnackBarService({
    required this.message,
    this.duration = const Duration(seconds: 2),
    this.foregroundColor,
    this.backgroundColor,
  });
  final Widget message;
  final Duration duration;
  final Color? foregroundColor;
  final Color? backgroundColor;

  void shown({SnackbarPosition position = SnackbarPosition.bottom, double? width}) {
    final context = rootNavigatorKey.currentContext!;
    scaffoldKey.currentState!.clearSnackBars();
    scaffoldKey.currentState!.showSnackBar(
      SnackBar(
        width: width,
        content: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                decoration: BoxDecoration(
                  color: backgroundColor ?? const Color(0xB1000000).whenDark(oGrey, context),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: message,
              ),
            ),
          ],
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        duration: duration,
        behavior: SnackBarBehavior.floating,
        margin: position == SnackbarPosition.middle ? EdgeInsets.only(bottom: context.screenHeight / 3) : null,
      ),
    );
  }
}

extension SnackBarExt on BuildContext {
  void showSnackBar(String message, {Duration duration = const Duration(seconds: 2)}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(SnackBar(content: Text(message), duration: duration));
  }
}
