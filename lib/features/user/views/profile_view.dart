import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/features/auth/controllers/auth_controller.dart';
import 'package:qareen/features/user/views/widgets/profile_authorized.dart';
import 'package:qareen/features/user/views/widgets/profile_unauthorized.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/widgets/custom_appbar_background.dart';

class ProfileView extends ConsumerWidget {
  const ProfileView({super.key});

  static const routeName = '/profile';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(authCtrlProvider).value;
    return MyScaffold(
      customAppBar: CustomAppBarBackground(),
      appBar: AppBar(titleSpacing: 30, title: const Text('Profile'), backgroundColor: Colors.transparent),
      child: RefreshIndicator(
        onRefresh: () async => Future.value(),
        child: ListView(
          shrinkWrap: true,
          children: [
            if (user != null) ...[ProfileAuthorized()] else ...[ProfileUnauthorized()],
          ],
        ),
      ),
    );
  }
}
