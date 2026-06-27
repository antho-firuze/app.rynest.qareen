import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/orientation_utils.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/features/quran/models/quran_page.dart';
import 'package:qareen/features/quran/views/bookmark_view.dart';
import 'package:qareen/features/quran/views/quran_search_view.dart';
import 'package:qareen/features/quran/views/quran_setting_view.dart';
import 'package:qareen/features/quran/views/widgets/goto_dialog.dart';
import 'package:super_icons/super_icons.dart';

class TopOverlay extends StatelessWidget {
  const TopOverlay({
    super.key,
    this.showOverlay = false,
    required this.pageNo,
    required this.page,
    required this.chapterName,
    required this.juz,
    required this.hizb,
    this.isBookmarked = false,
    this.showVerseListMode = false,
    this.onTogglePressed,
  });

  final int pageNo;
  final QuranPage page;
  final String chapterName;
  final int juz;
  final String hizb;
  final bool showOverlay;
  final bool isBookmarked;
  final bool showVerseListMode;
  final Function()? onTogglePressed;

  @override
  Widget build(BuildContext context) {
    return SlideContainer(
      showOverlay: showOverlay,
      offsetY: -1,
      child: Container(
        height: MediaQuery.of(context).viewPadding.top + kToolbarHeight,
        decoration: BoxDecoration(color: const Color(0xFF1D1D1D)),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Padding(padding: const EdgeInsets.only(top: 20, right: 20), child: BackButton()),
                Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Surat $chapterName').tsHeadline().clr(oWhite),
                        Text("Page $pageNo - Juz' $juz${hizb.isEmpty ? '' : ', $hizb'}").tsTitle().clr(oWhite),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SafeArea(
              left: context.isLandscape ? true : false,
              right: context.isLandscape ? true : false,
              top: context.isLandscape ? true : false,
              bottom: context.isLandscape ? true : false,
              child: Container(
                padding: context.isLandscape ? null : EdgeInsets.only(top: 12),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomActionButton(
                      icon: Icon(isBookmarked ? SuperIcons.mg_bookmark_fill : SuperIcons.mg_bookmark_line),
                      onPressed: () => context.goto(
                        page: BookmarkView(
                          action: isBookmarked ? BookmarkAction.edit : BookmarkAction.add,
                          chapterId: page.startChapterId,
                          verseNo: page.startVerseNo,
                        ),
                      ),
                    ),
                    CustomActionButton(
                      icon: Icon(showVerseListMode ? SuperIcons.ev_book_open : SuperIcons.bs_globe),
                      onPressed: onTogglePressed,
                    ),
                    PopupMenuButton<String>(
                      padding: EdgeInsetsGeometry.zero,
                      color: Color(0xFF313131),
                      iconColor: oWhite,
                      onSelected: (String value) async {
                        switch (value) {
                          case 'settings':
                            return await context.goto(page: const QuranSettingView());
                          case 'goto':
                            return await showDialog(context: context, builder: (context) => GotoDialog());
                          case 'search':
                            return await context.goto(page: const QuranSearchView());
                        }
                      },
                      itemBuilder: (BuildContext context) => [
                        PopupMenuItem<String>(
                          padding: EdgeInsets.only(left: 10, right: 50),
                          value: 'search',
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.search, color: oWhite),
                              Text('Search').clr(oWhite),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          padding: EdgeInsets.only(left: 10, right: 50),
                          value: 'goto',
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(SuperIcons.bx_walk, color: oWhite),
                              Text('Go to Surah').clr(oWhite),
                            ],
                          ),
                        ),
                        PopupMenuItem<String>(
                          padding: EdgeInsets.only(left: 10, right: 50),
                          value: 'settings',
                          child: Row(
                            spacing: 10,
                            children: [
                              Icon(Icons.settings, color: oWhite),
                              Text('Settings').clr(oWhite),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SlideContainer extends StatelessWidget {
  const SlideContainer({super.key, required this.child, this.offsetY = 1, this.showOverlay = false});

  final Widget child;
  final double offsetY;
  final bool showOverlay;

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle(statusBarIconBrightness: Brightness.light, statusBarBrightness: Brightness.light),
      child: AnimatedSlide(
        offset: Offset(0, showOverlay ? 0 : offsetY),
        duration: const Duration(milliseconds: 200),
        child: AnimatedOpacity(opacity: showOverlay ? 1 : 0, duration: const Duration(milliseconds: 200), child: child),
      ),
    );
  }
}
