import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/my_ui.dart';
import 'package:qareen/cff/utils/orientation_utils.dart';
import 'package:qareen/cff/utils/system_ui_overlay.dart';
import 'package:qareen/cff/utils/ui_helper.dart';

import '../controllers/init_ctrl.dart';
import '../widgets/logo.dart';
import '../widgets/skelton.dart';
import '../widgets/version_info.dart';

class SplashView extends ConsumerStatefulWidget {
  const SplashView({super.key});

  static const routeName = '/splash';

  @override
  ConsumerState<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends ConsumerState<SplashView> {
  @override
  void initState() {
    SystemUIOverlay.hideUIOverlay;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      bool result = await ref.read(initCtrlProvider).initApps();
      if (result == false) {
        SystemNavigator.pop();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    SystemUIOverlay.showUIOverlay;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      customBackground: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background-00.png'),
                fit: context.isLandscape ? BoxFit.fitWidth : BoxFit.fitHeight,
              ),
            ),
          ),
          if (context.isLandscape)
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black, // Top dark
                    Colors.transparent, // Center clear
                    Colors.black, // Bottom dark
                  ],
                  stops: const [0.0, 0.3, 1.0], // Fade boundaries
                ),
              ),
            )
          else
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Colors.black.withAlpha(200), // Top dark
                    Colors.transparent, // Center clear
                    Colors.black.withAlpha(200), // Bottom dark
                  ],
                  stops: const [0.0, 0.5, 1.0], // Fade boundaries
                ),
              ),
            ),
        ],
      ),
      child: Stack(
        children: [
          if (context.isLandscape) LandscapeView() else PortraitView(),
          // VERSION
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: context.screenHeight * .05),
              child: VersionInfo(color: oWhite),
            ),
          ),
          Align(alignment: Alignment.bottomCenter, child: Skelton(radius: 0)),
        ],
      ),
    );
  }
}

class PortraitView extends StatelessWidget {
  const PortraitView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.vertical,
      children: [
        // LOGO
        Expanded(
          flex: 2,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(width: 175, child: LogoV(logoHeight: 100)),
                Text('قرين').size(60).clr(oGold).family('sana'),
                Text('Sahabat Sejati \nPerjalanan Ibadah').tsHeadline().clr(oGold).bold().center(),
              ],
            ),
          ),
        ),
        Expanded(child: Container()),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 30.0, right: 30.0),
            child: Column(
              spacing: 40,
              children: [
                Text(
                  'Keselamatan, Koneksi Keluarga dan Pendampingan Ibadah Cerdas dalam Satu Ekosistem.',
                ).tsHeadline().clr(Colors.white).center().bold(),
                divider(padding: EdgeInsets.symmetric(horizontal: 80), thick: 7, color: oGold, roundedEdges: true),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LandscapeView extends StatelessWidget {
  const LandscapeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Flex(
      direction: Axis.horizontal,
      children: [
        // LOGO
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: LogoH(logoHeight: 100)),
              Text('قرين').size(60).clr(oGold).family('sana'),
              Text('Sahabat Sejati \nPerjalanan Ibadah').tsHeadline().clr(oGold).bold().center(),
            ],
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 120, right: 20),
            child: Text(
              'Keselamatan, Koneksi Keluarga dan Pendampingan Ibadah Cerdas dalam Satu Ekosistem.',
            ).tsHeadline().clr(Colors.white).right().bold(),
          ),
        ),
      ],
    );
  }
}
