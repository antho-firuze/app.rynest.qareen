import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/features/auth/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class PwdChangeView extends ConsumerWidget {
  const PwdChangeView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formStateKey = GlobalKey<FormState>();
    return MyScaffold(
      resizeToAvoidBottomInset: true,
      appBar: AppBar(title: Text('Rubah kode sandi')),
      child: ListView(
        children: [
          Form(
            key: formStateKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        20.height,
                        Text('Mohon masukkan kode sandi lama anda !').tsBody(),
                        10.height,
                        CustomInput(
                          minWidth: 500,
                          onChanged: (val) => ref.read(authCtrlProvider.notifier).password_old = val,
                          hintText: 'Kode sandi lama',
                          isPassword: true,
                          validator: (p0) => p0!.isEmpty ? 'Kolom kode sandi lama harus di isi' : null,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        20.height,
                        Text('Silahkan masukkan kode sandi anda yang baru').tsBody(),
                        10.height,
                        CustomInput(
                          minWidth: 500,
                          onChanged: (val) => ref.read(authCtrlProvider.notifier).password = val,
                          hintText: 'Kode sandi baru',
                          isPassword: true,
                          validator: (p0) => p0!.isEmpty
                              ? 'Kolom kode sandi baru harus di isi'
                              : p0.length < 5
                              ? 'Minimum 5 karakter'
                              : null,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                        20.height,
                        CustomInput(
                          minWidth: 500,
                          onChanged: (val) => ref.read(authCtrlProvider.notifier).password_confirm = val,
                          hintText: 'Konfirmasi kode sandi baru',
                          isPassword: true,
                          validator: (p0) => p0! != ref.read(authCtrlProvider.notifier).password
                              ? 'Kolom ini harus sama dengan kolom kode sandi baru di atas'
                              : null,
                          prefixIcon: const Icon(Icons.lock_outline),
                        ),
                      ],
                    ),
                    40.height,
                    CustomButton(
                      minWidth: 200,
                      child: Text('Simpan'),
                      onPressed: () async {
                        if (formStateKey.currentState!.validate() == false) {
                          return;
                        }
                        // Submit
                        await ref.read(authCtrlProvider.notifier).changePwd();
                      },
                    ),
                    20.height,
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
