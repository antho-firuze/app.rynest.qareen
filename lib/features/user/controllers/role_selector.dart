import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/views/splash_view.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'role_selector.g.dart';

final _kLogName = 'ROLE-SELECTOR';

enum Role { jamaah, muthowwif, admin, family }

@Riverpod(keepAlive: true)
class RoleSelector extends _$RoleSelector {
  @override
  Role? build() => null;

  Role? getUserRole() {
    int? index = ref.read(sharedPrefProvider).getInt('USER-ROLE');
    if (index == null) {
      state = null;
      logD("Role: null", name: _kLogName);
    } else {
      state = Role.values[index];
      logD("Role: ${Role.values[index]}", name: _kLogName);
    }
    return index == null ? null : Role.values[index];
  }

  Future save(Role role) async {
    state = role;
    await ref.read(sharedPrefProvider).setInt('USER-ROLE', role.index);
    await ref.read(pageUtilsProvider).gotoR(page: SplashView());
  }
}
