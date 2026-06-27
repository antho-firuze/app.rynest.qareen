import 'package:flutter/material.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/widgets/custom_appbar_background.dart';

class ParticipantView extends StatelessWidget {
  const ParticipantView({super.key});

  static const routeName = '/participant';

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      customAppBar: CustomAppBarBackground(),
      appBar: AppBar(
        titleSpacing: 30,
        title: const Text('Peserta'),
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
      ),
    );
  }
}
