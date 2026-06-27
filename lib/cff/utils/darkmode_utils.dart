import 'package:flutter/material.dart';
import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'router.dart';

part 'darkmode_utils.g.dart';

@Riverpod(keepAlive: true)
class MyThemeMode extends _$MyThemeMode {
  @override
  ThemeMode build() => _init();

  ThemeMode _init() {
    final _theme = ref.read(sharedPrefProvider).getString('THEME_MODE_KEY') ?? '_';
    if (_theme == '_') {
      ref.read(sharedPrefProvider).setString('THEME_MODE_KEY', 'system');
    }
    final _mode = switch (_theme) {
      'light' => ThemeMode.light,
      'dark' => ThemeMode.dark,
      _ => ThemeMode.system,
    };
    return _mode;
  }

  Future change(ThemeMode newTheme) async {
    state = newTheme;
    final _mode = switch (newTheme) {
      ThemeMode.light => 'light',
      ThemeMode.dark => 'dark',
      _ => 'system',
    };
    ref.read(sharedPrefProvider).setString('THEME_MODE_KEY', _mode);
    await Future.delayed(Durations.long2);
  }
}

extension DarkModeContext on BuildContext {
  bool get isDarkMode => Theme.of(this).brightness == Brightness.dark;
}

extension LightDark on Color {
  Color? whenDark(Color? dark, [BuildContext? context]) =>
      Theme.of(context ?? rootNavigatorKey.currentContext!).brightness == Brightness.light ? this : dark;
}

extension ExtNull on Null {
  Color? whenDark(Color? dark, [BuildContext? context]) =>
      Theme.of(context ?? rootNavigatorKey.currentContext!).brightness == Brightness.light ? this : dark;
}
