import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/services/snackbar_service.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/features/user/controllers/role_selector.dart';

class RoleSelectorView extends ConsumerWidget {
  const RoleSelectorView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        SnackBarService(message: Text('Pilih peran Anda sekarang').tsBody().center()).shown();
      },
      child: MyScaffold(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            spacing: 30,
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Pilih Peran Anda').tsHeadline().bold(),
                    Text('Sesuaikan pengalaman Anda di Qareen').tsBody(),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.person),
                        title: Text('Jamaah').tsTitle().bold(),
                        trailing: Icon(Icons.chevron_right),
                        // onTap: () => context.pop(Role.jamaah),
                        onTap: () => ref.read(roleSelectorProvider.notifier).save(Role.jamaah),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.co_present_rounded),
                        title: Text('Muthowwif/Pembimbing').tsTitle().bold(),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => ref.read(roleSelectorProvider.notifier).save(Role.muthowwif),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.admin_panel_settings),
                        title: Text('Petugas Travel/Admin').tsTitle().bold(),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => ref.read(roleSelectorProvider.notifier).save(Role.admin),
                      ),
                    ),
                    Card(
                      color: Colors.white,
                      child: ListTile(
                        leading: Icon(Icons.family_restroom_rounded),
                        title: Text('Anggota Keluarga').tsTitle().bold(),
                        trailing: Icon(Icons.chevron_right),
                        onTap: () => ref.read(roleSelectorProvider.notifier).save(Role.family),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
