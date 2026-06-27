import 'package:qareen/cff/services/snackbar_service.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';

class DarkModeButton extends ConsumerWidget {
  const DarkModeButton({super.key, required this.forAppBar});

  final bool forAppBar;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Icon? _icon;
    String? _caption;
    switch (ref.watch(myThemeModeProvider)) {
      case ThemeMode.light:
        _icon = Icon(Icons.light_mode);
        _caption = 'Light Mode';
        break;
      case ThemeMode.dark:
        _icon = Icon(Icons.dark_mode);
        _caption = 'Dark Mode';
        break;
      default:
        _icon = null;
        _caption = 'System Theme';
    }

    return CustomActionButton(
      tooltip: _caption,
      forAppBar: forAppBar,
      showBorder: forAppBar ? false : true,
      onPressed: () async {
        final _newTheme = switch (ref.watch(myThemeModeProvider)) {
          ThemeMode.system => ThemeMode.light,
          ThemeMode.light => ThemeMode.dark,
          ThemeMode.dark => ThemeMode.system,
        };
        await ref.read(myThemeModeProvider.notifier).change(_newTheme);

        final _message = switch (_newTheme) {
          ThemeMode.light => 'Light Mode',
          ThemeMode.dark => 'Dark Mode',
          _ => 'System Mode',
        };
        SnackBarService(message: Text('$_message').tsTitle()).shown();
      },
      icon: _icon,
      child: Text(_caption),
    );
  }
}
