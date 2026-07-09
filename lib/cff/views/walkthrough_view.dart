import 'package:go_router/go_router.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/orientation_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/logo.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/button/custom_button.dart';

class WalkthroughView extends ConsumerStatefulWidget {
  const WalkthroughView({super.key});

  static const routeName = '/walkthrough';

  @override
  ConsumerState<WalkthroughView> createState() => _WalkthroughViewState();
}

class _WalkthroughViewState extends ConsumerState<WalkthroughView> {
  PageController controller = PageController();
  int currIndex = 0;

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
      },
      child: MyScaffold(
        child: Stack(
          children: [
            PageView.builder(
              controller: controller,
              itemCount: walks.length,
              itemBuilder: (context, index) => BuildPage(walk: walks[index]),
              onPageChanged: (index) {
                setState(() {
                  currIndex = index;
                });
              },
            ),
            NavigatorWidget(controller: controller, currIndex: currIndex),
          ],
        ),
      ),
    );
  }
}

class NavigatorWidget extends StatelessWidget {
  const NavigatorWidget({super.key, required this.controller, required this.currIndex});

  final PageController controller;
  final int currIndex;

  @override
  Widget build(BuildContext context) {
    if (context.isLandscape) {
      return Stack(
        children: [
          if (currIndex != walks.length - 1)
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomButton(
                    flat: true,
                    showBorder: false,
                    minWidth: 100,
                    child: Text('Lewati').tsTitle().bold(),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PageIndicatorWidget(controller: controller),
                  if (currIndex < walks.length - 1)
                    CustomButton(
                      isRoundedEdges: true,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text('Next').tsHeadline(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(color: oGold, shape: BoxShape.circle),
                                child: Icon(Icons.arrow_forward, size: 30, color: oWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () =>
                          controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
                    )
                  else
                    CustomButton(
                      isRoundedEdges: true,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Text('Mulai').tsHeadline(),
                          Align(
                            alignment: Alignment.centerRight,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                              child: Container(
                                padding: const EdgeInsets.all(4.0),
                                decoration: const BoxDecoration(color: oGold, shape: BoxShape.circle),
                                child: Icon(Icons.check, size: 30, color: oWhite),
                              ),
                            ),
                          ),
                        ],
                      ),
                      onPressed: () => context.pop(),
                    ),
                ],
              ),
            ),
          ),
        ],
      );
    } else {
      return Stack(
        children: [
          if (currIndex != walks.length - 1)
            SafeArea(
              child: Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: CustomButton(
                    flat: true,
                    showBorder: false,
                    minWidth: 100,
                    child: Text('Lewati').tsTitle().bold(),
                    onPressed: () => context.pop(),
                  ),
                ),
              ),
            ),
          SafeArea(
            child: SizedBox.expand(
              child: Padding(
                padding: const EdgeInsets.only(bottom: 20.0),
                child: Column(
                  spacing: 20,
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    if (currIndex < walks.length - 1)
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: CustomButton(
                          isRoundedEdges: true,
                          child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Text('Next').tsHeadline(),
                              Align(
                                alignment: Alignment.centerRight,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  child: Container(
                                    padding: const EdgeInsets.all(4.0),
                                    decoration: const BoxDecoration(color: oGold, shape: BoxShape.circle),
                                    child: Icon(Icons.arrow_forward, size: 30, color: oWhite),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          onPressed: () =>
                              controller.nextPage(duration: const Duration(milliseconds: 500), curve: Curves.linear),
                        ),
                      )
                    else
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: SizedBox(
                          width: double.infinity,
                          child: CustomButton(
                            isRoundedEdges: true,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Text('Mulai').tsHeadline(),
                                Align(
                                  alignment: Alignment.centerRight,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                    child: Container(
                                      padding: const EdgeInsets.all(4.0),
                                      decoration: const BoxDecoration(color: oGold, shape: BoxShape.circle),
                                      child: Icon(Icons.check, size: 30, color: oWhite),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            onPressed: () => context.pop(),
                          ),
                        ),
                      ),
                    PageIndicatorWidget(controller: controller),
                    // 5.height,
                    // if (currIndex != walks.length - 1)
                    //   Padding(
                    //     padding: const EdgeInsets.symmetric(horizontal: 20),
                    //     child: SizedBox(
                    //       width: double.infinity,
                    //       child: CustomButton(flat: true, child: Text('Skip'), onPressed: () => context.pop()),
                    //     ),
                    //   ),
                    // 10.height,
                  ],
                ),
              ),
            ),
          ),
        ],
      );
    }
  }
}

class PageIndicatorWidget extends StatelessWidget {
  const PageIndicatorWidget({super.key, required this.controller});

  final PageController controller;

  @override
  Widget build(BuildContext context) {
    return SmoothPageIndicator(
      controller: controller,
      count: walks.length,
      effect: ExpandingDotsEffect(
        dotHeight: 15,
        dotWidth: 15,
        dotColor: oGrey70,
        activeDotColor: primaryLight.whenDark(oWhite, context),
      ),
    );
  }
}

class BuildPage extends StatelessWidget {
  const BuildPage({super.key, required this.walk});

  final Walk walk;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Flex(
          direction: Axis.vertical,
          children: [
            Expanded(
              flex: 2,
              child: SizedBox(width: double.infinity, child: walk.image),
            ),
            Expanded(flex: 1, child: Container()),
          ],
        ),
        Flex(
          direction: Axis.vertical,
          children: [
            Expanded(flex: 1, child: Container()),
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(top: 60.0),
                // color: oGreen,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: AlignmentGeometry.topCenter,
                    end: AlignmentGeometry.bottomCenter,
                    colors: [Colors.white.withAlpha(0), Colors.white],
                    stops: [0.0, 0.1],
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 60.0),
                  child: Column(
                    spacing: 20,
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [walk.title, divider(thick: 2), walk.subTitle],
                  ),
                ),
              ),
            ),
          ],
        ),
        SafeArea(
          child: Padding(padding: const EdgeInsets.all(20.0), child: Logo2(width: 60)),
        ),
      ],
    );
  }
}

class Walk {
  final Widget title;
  final Widget subTitle;
  final Widget image;
  final String imageSrc;

  Walk({required this.title, required this.subTitle, required this.image, required this.imageSrc});
}

List<Walk> walks = [
  Walk(
    title: RichText(
      text: TextSpan(
        text: 'Perjalanan Ibadah Lebih',
        style: tsHeadline().bold().clr(primaryLight),
        children: [
          TextSpan(text: ' '),
          TextSpan(text: 'Aman & Tenang', style: tsHeadline().bold().clr(oGold)),
        ],
      ),
    ),
    subTitle: Text(
      'Qareen hadir sebagai sahabat untuk membimbing, melindungi dan menghubungkan Anda.',
    ).tsTitle().bold(),
    image: Image.asset("assets/images/background-01.png", fit: BoxFit.cover),
    imageSrc: "assets/images/background-01.png",
  ),
  Walk(
    title: RichText(
      text: TextSpan(
        text: 'Pantau Keluarga, Ibadah',
        style: tsHeadline().bold().clr(primaryLight),
        children: [
          TextSpan(text: ' '),
          TextSpan(text: 'Lebih Tenang', style: tsHeadline().bold().clr(oGold)),
        ],
      ),
    ),
    subTitle: Text(
      'Lacak lokasi real-time, dapatkan peringatan cerdas dan tombol SOS darudar 2-klik.',
    ).tsTitle().bold(),
    image: Image.asset("assets/images/background-02.png", fit: BoxFit.cover),
    imageSrc: "assets/images/background-02.png",
  ),
  Walk(
    title: RichText(
      text: TextSpan(
        text: 'Panduan Ibadah',
        style: tsHeadline().bold().clr(primaryLight),
        children: [
          TextSpan(text: ' '),
          TextSpan(text: 'Cerdas,', style: tsHeadline().bold().clr(oGold)),
          TextSpan(text: ' '),
          TextSpan(text: 'Setiap Langkah', style: tsHeadline().bold().clr(primaryLight)),
          TextSpan(text: ' '),
          TextSpan(text: 'Berarti', style: tsHeadline().bold().clr(oGold)),
        ],
      ),
    ),
    subTitle: Text(
      'Dapatkan panduan ibadah offline, pengingat waktu sholat, navigasi dan informasi penting selama di Tanah Suci.',
    ).tsTitle().bold(),
    // Text(
    //   'Dengan Amoora, Anda dapat membuat strategi pemasaran yang efektif dan menarik lebih banyak pelanggan.',
    // ).tsBody().clip(),
    image: Image.asset("assets/images/background-03.png", fit: BoxFit.cover),
    imageSrc: "assets/images/background-03.png",
  ),
  Walk(
    title: RichText(
      text: TextSpan(
        text: 'Terhubung, Terarah, Bersama',
        style: tsHeadline().bold().clr(primaryLight),
        children: [
          TextSpan(text: ' '),
          TextSpan(text: 'Selamanya', style: tsHeadline().bold().clr(oGold)),
        ],
      ),
    ),
    subTitle: Text(
      'Tetap terhubung dengan rombongan, dapatkan informasi terbaru, dan jalin silaturahmi hingga kembali ke tanah air.',
    ).tsTitle().bold(),
    // Text(
    //   'Dengan Amoora, Anda dapat membuat strategi pemasaran yang efektif dan menarik lebih banyak pelanggan.',
    // ).tsBody().clip(),
    image: Image.asset("assets/images/background-04.png", fit: BoxFit.cover),
    imageSrc: "assets/images/background-04.png",
  ),
];
