import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/widgets/connectivity_wrapper.dart';
import 'package:qareen/cff/widgets/screen_debug_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_color.dart';

enum ScreenOrientation { both, portrait, landscape }

class MyUI extends ConsumerWidget {
  const MyUI({
    super.key,
    this.decoration,
    required this.child,
    this.enabledSafeArea = true,
    this.customUiOverlayStyle,
    // this.isTransparent = false,
    this.showScreenInfo = false,
    this.showConnectivityInfo = true,
    this.showThemeModeInfo = false,
    this.orientation = ScreenOrientation.both,
    this.customStatusBar,
    this.customAppBar,
    this.customBackground,
    this.statusBarColor,
    this.appBarColor,
  });

  final Decoration? decoration;
  final Widget child;
  final bool enabledSafeArea;
  final SystemUiOverlayStyle? customUiOverlayStyle;
  // final bool isTransparent;
  final bool showScreenInfo;
  final bool showConnectivityInfo;
  final bool showThemeModeInfo;
  final ScreenOrientation orientation;
  final Widget? customStatusBar;
  final Widget? customAppBar;
  final Widget? customBackground;
  final Color? statusBarColor;
  final Color? appBarColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _newTheme = switch (ref.watch(myThemeModeProvider)) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      _ => 'system',
    };
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        // statusBarColor: Colors.transparent,
        // statusBarColor: statusBarColor,
        // statusBarColor: Colors.purple,
        // statusBarIconBrightness: Brightness.light,
        statusBarIconBrightness: _newTheme == 'light' ? Brightness.dark : Brightness.light,
        statusBarBrightness: _newTheme == 'light' ? Brightness.dark : Brightness.light,
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
        child: ConnectivityWrapper(
          enabled: showConnectivityInfo,
          child: Stack(
            alignment: Alignment.topCenter,
            children: [
              // BACKGROUND
              if (customBackground != null) ...[
                customBackground!,
              ] else ...[
                Container(color: Theme.of(context).scaffoldBackgroundColor),
              ],
              // APP BAR
              if (customAppBar != null) ...[
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                  color: appBarColor ?? primaryLight.whenDark(Colors.black),
                  child: customAppBar,
                ),
              ],
              // STATUS BAR
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).viewPadding.top,
                color: statusBarColor ?? primaryLight.whenDark(Colors.black),
                child: customStatusBar,
              ),
              // BODY
              if (enabledSafeArea) SafeArea(child: child) else child,
              // SCREEN INFO
              if (showScreenInfo) ScreenDebugInfo(),
            ],
          ),
        ),
      ),
    );
  }
}
