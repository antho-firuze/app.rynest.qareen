import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_goto.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/views/bookmark_view.dart';
import 'package:qareen/features/quran/views/quran_setting_view.dart';
import 'package:qareen/features/quran/views/widgets/chapter_header.dart';
import 'package:qareen/features/quran/views/widgets/goto_dialog.dart';
import 'package:qareen/features/quran/views/widgets/chapter_verse.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final _kLogName = 'CHAPTER-VIEW';

class ChapterView extends ConsumerStatefulWidget {
  const ChapterView({super.key});

  @override
  ConsumerState<ChapterView> createState() => _ChapterViewState();
}

class _ChapterViewState extends ConsumerState<ChapterView> {
  final _autoScrollCtrl = AutoScrollController();
  final _headerCarouselController = CarouselSliderController();
  final _contentCarouselController = CarouselSliderController();
  List<Chapter> chapters = [];
  Bookmark? selected;
  bool reScroll = false;

  @override
  void initState() {
    chapters = ref.read(quranChapterProvider);
    selected = ref.read(quranSelectionProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) => autoScroll());
    WakelockPlus.enable();
    super.initState();
  }

  void autoScroll([Bookmark? goto]) async {
    if (reScroll) {
      selected = ref.read(quranSelectionProvider);
      reScroll = false;
    }
    int index = selected?.verseId ?? 1;
    logX(
      'auto scroll: chapterId: ${selected?.chapterId}, verseId: ${index}, verseNum: ${selected?.verseNo}',
      name: _kLogName,
    );
    await _autoScrollCtrl.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
  }

  @override
  Widget build(BuildContext context) {
    logX("Build widget", name: _kLogName);

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // logX('onPopInvoked', name: _kLogName);
        WakelockPlus.disable();
        context.popz();
      },
      child: MyScaffold(
        showConnectivityInfo: false,
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              final recent = ref.watch(quranSelectionProvider);
              return Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("Juz ${recent?.juz ?? 1}")],
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(SuperIcons.bx_walk),
              onPressed: () async {
                final _chapterId = ref.read(quranSelectionProvider)?.chapterId ?? 1;
                ref.read(quranGotoProvider.notifier).selectByChapterVerseNum(_chapterId);
                await showDialog(context: context, builder: (BuildContext context) => GotoDialog());
              },
            ),
            IconButton(
              icon: const Icon(SuperIcons.ev_settings_outline),
              onPressed: () async => await context.goto(page: const QuranSettingView()),
            ),
          ],
        ),
        child: Stack(
          children: [
            // CHAPTER HEADER
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Container(
                color: primaryLight.whenDark(oBlack),
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: CarouselSlider.builder(
                  carouselController: _headerCarouselController,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    reverse: true,
                    enlargeCenterPage: false,
                    initialPage: (selected?.chapterId ?? 1) - 1,
                    viewportFraction: .4,
                    onPageChanged: (index, reason) {
                      logX("header changed to index: $index", name: _kLogName);
                      _contentCarouselController.animateToPage(index);
                    },
                  ),
                  itemCount: chapters.length,
                  itemBuilder: (context, index, realIndex) {
                    return Consumer(
                      builder: (context, ref, child) {
                        int currChapterId = (ref.watch(quranSelectionProvider)?.chapterId ?? 1) - 1;
                        bool isCurrIndex = index == currChapterId;
                        // logX("currIndex: $index, currChapterId: ${currChapterId}", name: _kLogName);
                        return GestureDetector(
                          onTap: () {
                            _headerCarouselController.animateToPage(index);
                            _contentCarouselController.animateToPage(index);
                          },
                          child: Text(
                            "${chapters[index].id}. ${chapters[index].name}",
                          ).tsTitle().clr(isCurrIndex ? oWhite : Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            // CHAPTER BODY
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Container(
                color: primaryDark,
                child: CarouselSlider.builder(
                  carouselController: _contentCarouselController,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    height: double.infinity,
                    initialPage: (selected?.chapterId ?? 1) - 1,
                    viewportFraction: 1,
                    enlargeCenterPage: false,
                    reverse: true,
                    onPageChanged: (index, reason) {
                      logX("content chenged to index: $index", name: _kLogName);
                      _headerCarouselController.animateToPage(index);
                    },
                  ),
                  itemCount: chapters.length,
                  itemBuilder: (context, index, realIndex) {
                    final chapter = chapters[index];
                    final verses = ref.read(quranVerseProvider.notifier).getVerses(chapter.id);

                    // final verses = chapter.verses!;
                    // logX("chapterId: ${chapter.id} - verses: ${verses.length}", name: _kLogName);
                    List<Widget> versesList = [];
                    for (var verse in verses) {
                      final _isVerseBookmarked = ref.read(quranBookmarkProvider.notifier).isVerseBookmarked(verse.id);
                      if (verse.number == 1) {
                        versesList.add(
                          ChapterHeader(
                            autoScrollCtrl: _autoScrollCtrl,
                            index: verse.id,
                            chapter: chapter,
                            verse: verse,
                            onChanged: (chapterId, verseId) =>
                                ref.read(quranSelectionProvider.notifier).lastOpened(chapterId, verseId: verseId),
                          ),
                        );
                      }

                      versesList.add(
                        ChapterVerse(
                          autoScrollCtrl: _autoScrollCtrl,
                          index: verse.number == 1 ? 0 : verse.id,
                          chapter: chapter,
                          verse: verse,
                          onTap: (chapter, verse) => context.goto(
                            page: BookmarkView(
                              action: _isVerseBookmarked ? BookmarkAction.edit : BookmarkAction.add,
                              chapterId: chapter.id,
                              verseNo: verse.number,
                            ),
                          ),
                          onChanged: (chapterId, verseId) {
                            // logX('chapterId: ${chapterId} - verseId: ${verseId}', name: _kLogName);
                            ref.read(quranSelectionProvider.notifier).lastOpened(chapterId, verseId: verseId);
                          },
                        ),
                      );
                    }
                    return CustomScrollView(controller: _autoScrollCtrl, slivers: versesList);
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
