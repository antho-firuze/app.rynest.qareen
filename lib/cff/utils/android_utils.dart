import 'package:android_navigation_settings/android_navigation_settings.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'android_utils.g.dart';

@riverpod
AndroidUtil androidUtil(Ref ref) => AndroidUtil(ref);

class AndroidUtil {
  AndroidUtil(this.ref);
  Ref ref;
  
  final navigationSettings = AndroidNavigationSettings();

  Future<int> navMode() async => await navigationSettings.getNavigationMode();
}
