import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/widgets/connectivity_wrapper.dart';
import 'package:qareen/cff/widgets/screen_debug_info.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../core/app_color.dart';

enum ScreenOrientation { both, portrait, landscape }

class MyScaffold extends ConsumerWidget {
  const MyScaffold({
    super.key,
    this.appBar,
    this.child,
    this.enabledSafeArea = true,
    this.showScreenInfo = false,
    this.showConnectivityInfo = true,
    this.orientation = ScreenOrientation.both,
    this.customAppBar,
    this.customBackground,
    this.appBarColor,
    this.backgroundColor,
  });

  final PreferredSizeWidget? appBar;
  final Widget? child;
  final bool enabledSafeArea;
  final bool showScreenInfo;
  final bool showConnectivityInfo;
  final ScreenOrientation orientation;
  final Widget? customAppBar;
  final Widget? customBackground;
  final Color? appBarColor;
  final Color? backgroundColor;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _newTheme = switch (ref.watch(myThemeModeProvider)) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      _ => 'system',
    };
    // print('build my_scaffold');
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(
        statusBarIconBrightness: _newTheme == 'light' || _newTheme == 'system' ? Brightness.dark : Brightness.light,
        statusBarBrightness: _newTheme == 'light' || _newTheme == 'system' ? Brightness.dark : Brightness.light,
      ),
      child: MediaQuery(
        data: MediaQuery.of(context).copyWith(textScaler: const TextScaler.linear(.8)),
        child: ConnectivityWrapper(
          enabled: showConnectivityInfo,
          child: Stack(
            children: [
              // CUSTOM BACKGROUND
              if (customBackground != null) customBackground!,
              // CUSTOM APP BAR
              if (customAppBar != null)
                Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
                  color: appBarColor ?? primaryLight.whenDark(Colors.black),
                  child: customAppBar,
                ),
              // BODY
              Scaffold(
                appBar: customAppBar == null
                    ? appBar == null
                          ? null
                          : (appBar as AppBar).copyWith(backgroundColor: appBarColor)
                    : appBar == null
                    ? null
                    : (appBar as AppBar).copyWith(backgroundColor: Colors.transparent),
                backgroundColor: customBackground == null && customAppBar == null
                    ? backgroundColor
                    : Colors.transparent,
                body: enabledSafeArea ? SafeArea(child: child ?? Container()) : child,
              ),
              // SCREEN INFO
              if (showScreenInfo) ScreenDebugInfo(),
            ],
          ),
        ),
      ),
    );
  }
}

extension CustomAppBar on AppBar {
  AppBar copyWith({Color? backgroundColor}) => AppBar(
    automaticallyImplyLeading: automaticallyImplyLeading,
    title: title,
    titleSpacing: titleSpacing,
    actions: actions,
    leading: leading,
    leadingWidth: leadingWidth,
    shape: shape,
    bottom: bottom,
    backgroundColor: backgroundColor,
  );
}
