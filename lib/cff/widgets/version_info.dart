import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/controllers/version_ctrl.dart';
import 'package:qareen/cff/widgets/skelton.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

class VersionInfo extends ConsumerWidget {
  const VersionInfo({super.key, this.color});

  final Color? color;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref
        .watch(fetchVersionProvider)
        .when(
          loading: () => const Skelton(),
          error: (Object error, StackTrace stackTrace) => Container(),
          data: (String data) => Text('Version $data').tsTitle().clr(color),
        );
  }
}
