import 'package:qareen/cff/controllers/permission_ctrl.dart';
import 'package:qareen/features/auth/controllers/auth_controller.dart';
import 'package:qareen/features/user/controllers/role_selector.dart';
import 'package:qareen/features/user/views/admin_dashboard.dart';
import 'package:qareen/features/user/views/family_dashboard.dart';
import 'package:qareen/features/user/views/jamaah_dashboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/features/user/views/muthowwif_dashboard.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  static const routeName = '/home';

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> with WidgetsBindingObserver {
  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      ref.read(permissionCtrlProvider).initialize();
    });
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) async {
    if (state == AppLifecycleState.resumed) {
      WidgetsBinding.instance.addPostFrameCallback((_) async {
        ref.read(permissionCtrlProvider).initialize();
      });
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    final user = ref.watch(authCtrlProvider).value;
    final role = ref.read(roleSelectorProvider);
    switch (role) {
      case Role.jamaah:
        return JamaahDashboard(user: user);
      case Role.muthowwif:
        return MuthowwifDashboard(user: user);
      case Role.admin:
        // return MuthowwifDashboard(user: user);
        return AdminDashboard(user: user);
      default:
        return FamilyDashboard(user: user);
    }
  }
}
