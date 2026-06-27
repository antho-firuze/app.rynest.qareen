import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/views/bookmark_view.dart';
import 'package:qareen/features/quran/views/quran_setting_view.dart';
import 'package:qareen/features/quran/views/widgets/chapter_header.dart';
import 'package:qareen/features/quran/views/widgets/chapter_verse.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

final _kLogName = 'JUZ-VIEW';
final autoScrollCtrl = AutoScrollController();
final headerCarouselController = CarouselSliderController();
final contentCarouselController = CarouselSliderController();

class JuzView extends ConsumerWidget {
  const JuzView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzs = ref.read(quranJuzProvider);
    final selected = ref.read(quranSelectionProvider);

    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (selected == null) return;
      int index = selected.verseId ?? 1;
      logX('auto scroll to verseId: ${index}', name: _kLogName);
      await autoScrollCtrl.scrollToIndex(index, preferPosition: AutoScrollPosition.begin);
    });

    WakelockPlus.enable();

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        // logX('onPopInvoked', name: _kLogName);
        WakelockPlus.disable();
        context.pop();
      },
      child: MyScaffold(
        showConnectivityInfo: false,
        appBar: AppBar(
          title: Consumer(
            builder: (context, ref, child) {
              final recent = ref.watch(quranSelectionProvider);
              final chapterName = ref.read(quranChapterProvider.notifier).getChapterName(recent?.chapterId ?? 1);
              return Padding(
                padding: const EdgeInsets.only(right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [Text("${recent?.chapterId}. Surah ${chapterName}")],
                ),
              );
            },
          ),
          actions: [
            IconButton(
              icon: const Icon(SuperIcons.ev_settings_outline),
              onPressed: () async => await context.goto(page: const QuranSettingView()),
            ),
          ],
        ),
        child: Stack(
          children: [
            SizedBox(
              height: 30,
              width: double.infinity,
              child: Container(
                color: primaryLight.whenDark(oBlack),
                padding: EdgeInsets.only(top: 5.0, bottom: 5.0),
                child: CarouselSlider.builder(
                  carouselController: headerCarouselController,
                  options: CarouselOptions(
                    enableInfiniteScroll: false,
                    reverse: true,
                    enlargeCenterPage: false,
                    initialPage: (selected?.juz ?? 1) - 1,
                    viewportFraction: .4,
                    onPageChanged: (index, reason) {
                      logX("header changed to index: $index", name: _kLogName);
                      contentCarouselController.animateToPage(index);
                    },
                  ),
                  itemCount: juzs.length,
                  itemBuilder: (context, index, realIndex) {
                    return Consumer(
                      builder: (context, ref, child) {
                        int currJuzId = (ref.watch(quranSelectionProvider)?.juz ?? 1) - 1;
                        bool isCurrIndex = index == currJuzId;
                        logX("currIndex: $index, currJuzId: ${currJuzId}", name: _kLogName);
                        return GestureDetector(
                          onTap: () {
                            // final juzId = index + 1;
                            // ref.read(quranSelectionProvider.notifier).selectByJuz(juzId);
                            headerCarouselController.animateToPage(index);
                            contentCarouselController.animateToPage(index);
                          },
                          child: Text("Juz ${index + 1}").tsTitle().clr(isCurrIndex ? oWhite : Colors.grey),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 30),
              child: CarouselSlider.builder(
                carouselController: contentCarouselController,
                options: CarouselOptions(
                  enableInfiniteScroll: false,
                  height: double.infinity,
                  initialPage: (selected?.juz ?? 1) - 1,
                  viewportFraction: 1,
                  enlargeCenterPage: false,
                  reverse: true,
                  onPageChanged: (index, reason) {
                    logX("content chenged to index: $index", name: _kLogName);
                    headerCarouselController.animateToPage(index);
                  },
                ),
                itemCount: juzs.length,
                itemBuilder: (context, index, realIndex) {
                  final juz = juzs[index];
                  final verses = ref.read(quranVerseProvider.notifier).getVersesByJuz(juz.id);
                  logX("juz: ${juz.id} - verses: ${juz.versesCount}", name: _kLogName);
                  List<Widget> versesList = [];
                  for (var verse in verses) {
                    final chapter = ref.read(quranChapterProvider.notifier).getChapter(verse.chapter);
                    final _isVerseBookmarked = ref.read(quranBookmarkProvider.notifier).isVerseBookmarked(verse.id);
                    if (verse.number == 1) {
                      versesList.add(
                        ChapterHeader(
                          autoScrollCtrl: autoScrollCtrl,
                          index: verse.id,
                          chapter: chapter,
                          verse: verse,
                          onChanged: (chapterId, verseId) {
                            ref
                                .read(quranSelectionProvider.notifier)
                                .lastOpened(chapterId, verseId: verseId, note: 'byJuz');
                          },
                        ),
                      );
                    }
                    versesList.add(
                      ChapterVerse(
                        autoScrollCtrl: autoScrollCtrl,
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
                        onChanged: (chapterId, verseId) => ref
                            .read(quranSelectionProvider.notifier)
                            .lastOpened(chapterId, verseId: verseId, note: 'byJuz'),
                      ),
                    );
                  }
                  return CustomScrollView(controller: autoScrollCtrl, slivers: versesList);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
