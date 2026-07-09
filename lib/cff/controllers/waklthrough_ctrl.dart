import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'waklthrough_ctrl.g.dart';

@riverpod
WaklthroughCtrl Waklthrough(Ref ref) => WaklthroughCtrl(ref);

class WaklthroughCtrl {
  Ref ref;
  WaklthroughCtrl(this.ref);

  bool isShow() => ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;

  Future startTheApps() async => await ref.read(sharedPrefProvider).setBool('SHOW_WALKTHROUGH', false);
}
