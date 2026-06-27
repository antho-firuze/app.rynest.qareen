import 'package:qareen/cff/core/app_theme.dart';
import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:qareen/cff/services/timezone_service.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final scaffoldKey = GlobalKey<ScaffoldMessengerState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureLocalTimeZone();

  final pref = await SharedPreferences.getInstance();

  runApp(ProviderScope(overrides: [sharedPrefProvider.overrideWithValue(pref)], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final goRouter = ref.watch(goRouterProvider);
    final themeMode = ref.watch(myThemeModeProvider);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      // supportedLocales: AppLocalizations.supportedLocales,
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      theme: AppTheme.lightThemeData,
      darkTheme: AppTheme.darkThemeData,
      themeMode: themeMode,
      routerConfig: goRouter,
      scaffoldMessengerKey: scaffoldKey,
    );
  }
}
