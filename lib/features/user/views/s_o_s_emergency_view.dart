import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';

class SOSEmergencyView extends StatelessWidget {
  const SOSEmergencyView({super.key});

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      invertBrightness: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        leading: CustomActionButton(
          invertColor: true,
          actionType: ActionType.back,
          onPressed: () => context.pop(),
        ),
        title: Text('SOS Darurat').clr(Colors.red),
      ),
      child: ListView(
        children: [
          40.height,
          GestureDetector(
            onDoubleTap: () {
              print('OnDoubleTap');
            },
            child: AvatarGlow(
              glowColor: Colors.red,
              glowShape: BoxShape.circle,
              glowRadiusFactor: .3,
              child: Container(
                padding: EdgeInsets.all(40),
                decoration: BoxDecoration(color: Colors.red, shape: BoxShape.circle),
                child: Center(child: Text('SOS').size(70).bold().clr(oWhite)),
              ),
            ),
          ),
          40.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: Column(
              spacing: 20,
              children: [
                Text('Tekan 2x untuk mengirim darurat \nke grup & komando hub').tsTitle().center(),
                Text('* Gunakan hanya dalam keadaan darurat').tsBody().center(),
              ],
            ),
          ),
          40.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomContainer(
              title: Text('Info Medis Singkat'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Alergi: Tidak ada').tsBody(),
                  Text('Penyakit: Hipertensi').tsBody(),
                  Text('Gol. Darah: O+').tsBody(),
                ],
              ),
            ),
          ),
          20.height,
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomContainer(
              title: Text('Kontak Darurat'),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [Text('+62 812-1234-5678 (Anak)').tsBody(), Text('+62 812-1234-5678 (Suami/Istri)').tsBody()],
              ),
            ),
          ),
          40.height,
        ],
      ),
    );
  }
}

class CustomContainer extends StatelessWidget {
  const CustomContainer({super.key, required this.title, this.textMore, this.child});

  final Widget title;
  final Widget? textMore;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey[300]!),
        borderRadius: BorderRadius.circular(12.0),
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 10.0, bottom: 10.0),
        child: Column(
          spacing: 15,
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [(title as Text).tsTitle().bold(), Icon(Icons.chevron_right)],
            ),
            child ?? Container(),
          ],
        ),
      ),
    );
  }
}
