import 'package:qareen/cff/controllers/permission_ctrl.dart';
import 'package:qareen/cff/services/assets_service.dart';
import 'package:qareen/cff/services/network_service.dart';
import 'package:qareen/cff/services/version_service.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/views/walkthrough_view.dart';
import 'package:qareen/features/auth/views/signin_view.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/features/auth/controllers/auth_controller.dart';
import 'package:qareen/cff/utils/router.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/views/home_quran_view.dart';
import 'package:qareen/features/user/views/home_view.dart';

import '../services/sharedpref_service.dart';

class InitCtrl {
  final Ref ref;

  InitCtrl(this.ref) : _showWalkThrough = ref.read(sharedPrefProvider).getBool('SHOW_WALKTHROUGH') ?? true;

  final bool _showWalkThrough;

  Future<bool> initApps() async {
    // Initialize Network
    ref.read(checkDataConnectionProvider);

    // Initialize Permissions
    ref.read(permissionCtrlProvider).initialize();

    // Goto Next Route
    // await ref.read(sharedPrefProvider).remove('SHOW_WALKTHROUGH');
    if (_showWalkThrough) {
      ref.read(sharedPrefProvider).setBool('SHOW_WALKTHROUGH', false);
      await ref.read(pageUtilsProvider).goto(page: WalkthroughView());
    }

    // Check User authorized
    // if (await ref.read(authCtrlProvider.notifier).isAuthorized() == false) {
    //   bool result = await ref.read(pageUtilsProvider).goto(page: SignInView(canPop: false));
    //   if (result == false) {
    //     return false;
    //   }
    // }

    // Check New Version
    // if (await ref.read(versionServiceProvider).newVersionAvailable() == true) {
    //   return false;
    // }

    // ref.read(goRouterProvider).go('/home');
    ref.read(pageUtilsProvider).gotoR(page: HomeQuranView());
    return true;
  }
}

final initCtrlProvider = Provider(InitCtrl.new);
