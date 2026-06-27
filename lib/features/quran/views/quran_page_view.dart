import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:go_router/go_router.dart';
import 'package:path/path.dart';
import 'package:qareen/cff/services/snackbar_service.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/debouncer.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/orientation_utils.dart';
import 'package:qareen/cff/utils/system_ui_overlay.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_overlay.dart';
import 'package:qareen/features/quran/controllers/quran_page.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:qareen/features/quran/models/quran_page.dart';
import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/features/quran/utils/quran_assets_layout2.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';
import 'package:qareen/features/quran/views/widgets/custom_text.dart';
import 'package:qareen/features/quran/views/widgets/download_asset_widget.dart';
import 'package:qareen/features/quran/views/widgets/quran_overlay.dart';
import 'package:qareen/features/quran/views/widgets/verse_no.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class QuranPageView extends ConsumerStatefulWidget {
  const QuranPageView({super.key});

  @override
  ConsumerState<QuranPageView> createState() => _QuranPageViewState();
}

class _QuranPageViewState extends ConsumerState<QuranPageView> {
  PageController _pageController = PageController();
  Bookmark? selected;
  bool triggerScrollAfterAssetsDownloaded = false;

  @override
  void initState() {
    selected = ref.read(quranSelectionProvider);
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(quranAssetsLayout2Provider.notifier).initialize();
      autoScroll();
    });
    WakelockPlus.enable();
    SystemUIOverlay.hideUIOverlay;
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    WakelockPlus.disable();
    SystemUIOverlay.showUIOverlay;
    super.dispose();
  }

  void autoScroll() {
    if (_pageController.hasClients) {
      print('autoScroll');
      _pageController.jumpToPage((selected?.page ?? 1) - 1);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(quranAssetsLayout2Provider) == false) {
      triggerScrollAfterAssetsDownloaded = true;
      return DownloadAssetWidget(
        progress: ref.watch(quranAssetsLayout2Provider.notifier).progressPercentage,
        title: ref.watch(quranAssetsLayout2Provider.notifier).progressName,
      );
    }

    if (triggerScrollAfterAssetsDownloaded) {
      Future.delayed(Duration.zero, () => autoScroll());
    }

    final showOverlay = ref.watch(quranOverlayProvider);
    if (showOverlay == true) {
      SystemUIOverlay.showUIOverlay;
    } else {
      SystemUIOverlay.hideUIOverlay;
    }

    final pages = ref.watch(quranPagesProvider);
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          return;
        }
        debugPrint('onPopInvoked');

        ref.read(quranOverlayProvider.notifier).toggle(false);
        ref.read(quranPagesProvider.notifier).toggle(false);
        context.pop();
      },
      child: MyScaffold(
        enabledSafeArea: false,
        backgroundColor: Color(0xFFF5E6C8).whenDark(Colors.black),
        child: OrientationBuilder(
          builder: (context, orientation) {
            return GestureDetector(
              onTap: () => ref.read(quranOverlayProvider.notifier).toggle(),
              child: PageView.builder(
                controller: _pageController,
                itemCount: pages.length,
                reverse: true,
                onPageChanged: (value) async {
                  int page = value + 1;
                  // print('onPageChanged: $page');
                  await ref.read(quranSelectionProvider.notifier).lastOpenPage(page);
                },
                itemBuilder: (context, index) {
                  int currentPage = index + 1;
                  final page = pages[index];

                  final chapterName = ref.read(quranChapterProvider.notifier).getChapterName(page.endChapterId);
                  final juzId = ref.read(quranVerseProvider.notifier).getJuzId(page.startChapterId, page.startVerseNo);
                  final printHizb = ref.read(quranPagesProvider.notifier).getHizbText(index);
                  final printJuz = ref.read(quranPagesProvider.notifier).getJuzText(index);
                  final isBookmarked = ref.read(quranBookmarkProvider.notifier).isPageBookmarked(page.id);
                  // print('page: ${page.id}');
                  if (printJuz.isNotEmpty) {
                    Future.delayed(
                      Duration.zero,
                      () => SnackBarService(message: Center(child: Text(printJuz).tsTitle().bold())).shown(width: 200),
                    );
                  } else {
                    if (printHizb.isNotEmpty) {
                      Future.delayed(
                        Duration.zero,
                        () =>
                            SnackBarService(message: Center(child: Text(printHizb).tsTitle().bold())).shown(width: 200),
                      );
                    }
                  }
                  final verses = ref.read(quranPagesProvider.notifier).getVerses(page.id);
                  final showVerseListMode = ref.watch(quranPagesProvider.notifier).showVerseListMode;
                  if (showVerseListMode) {
                    final arabicFontSize = ref.watch(quranSettingProvider).arabicFontSize;
                    final latinFontSize = ref.watch(quranSettingProvider).latinFontSize;
                    final transFontSize = ref.watch(quranSettingProvider).transFontSize;
                    final showLatin = ref.watch(quranSettingProvider).showLatin;
                    final showTrans = ref.watch(quranSettingProvider).showTrans;
                    return VersesListMode(
                      verses: verses,
                      ref: ref,
                      arabicFontSize: arabicFontSize,
                      showLatin: showLatin,
                      showTrans: showTrans,
                      latinFontSize: latinFontSize,
                      transFontSize: transFontSize,
                      page: page,
                      currentPage: currentPage,
                      chapterName: chapterName,
                      juzId: juzId,
                      printHizb: printHizb,
                      showOverlay: showOverlay,
                      isBookmarked: isBookmarked,
                      showVerseListMode: showVerseListMode,
                    );
                  }

                  if (orientation == Orientation.landscape) {
                    return PageViewLandscape(
                      currentPage: currentPage,
                      page: page,
                      chapterName: chapterName,
                      juz: juzId,
                      hizb: printHizb,
                      showOverlay: showOverlay,
                      isBookmarked: isBookmarked,
                    );
                  } else {
                    return PageViewPortrait(
                      currentPage: currentPage,
                      page: page,
                      chapterName: chapterName,
                      juz: juzId,
                      hizb: printHizb,
                      showOverlay: showOverlay,
                      isBookmarked: isBookmarked,
                      showVerseListMode: showVerseListMode,
                      onTogglePressed: () => ref.read(quranPagesProvider.notifier).toggle(),
                    );
                  }
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

class VersesListMode extends StatelessWidget {
  const VersesListMode({
    super.key,
    required this.verses,
    required this.ref,
    required this.arabicFontSize,
    required this.showLatin,
    required this.showTrans,
    required this.latinFontSize,
    required this.transFontSize,
    required this.page,
    required this.currentPage,
    required this.chapterName,
    required this.juzId,
    required this.printHizb,
    required this.showOverlay,
    required this.isBookmarked,
    required this.showVerseListMode,
  });

  final List<Verse> verses;
  final WidgetRef ref;
  final double arabicFontSize;
  final bool showLatin;
  final bool showTrans;
  final double latinFontSize;
  final double transFontSize;
  final QuranPage page;
  final int currentPage;
  final String chapterName;
  final int juzId;
  final String printHizb;
  final bool showOverlay;
  final bool isBookmarked;
  final bool showVerseListMode;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        CustomScrollView(
          slivers: [
            for (var verse in verses) ...[
              if (verse.number == 1) ...[ChapterHeader(ref: ref, verse: verse)],
              ChapterVerse(
                ref: ref,
                verse: verse,
                arabicFontSize: arabicFontSize,
                showLatin: showLatin,
                showTrans: showTrans,
                latinFontSize: latinFontSize,
                transFontSize: transFontSize,
              ),
            ],
          ],
        ),
        TopOverlay(
          page: page,
          pageNo: currentPage,
          chapterName: chapterName,
          juz: juzId,
          hizb: printHizb,
          showOverlay: showOverlay,
          isBookmarked: isBookmarked,
          showVerseListMode: showVerseListMode,
          onTogglePressed: () => ref.read(quranPagesProvider.notifier).toggle(),
        ),
      ],
    );
  }
}

class ChapterVerse extends StatelessWidget {
  const ChapterVerse({
    super.key,
    required this.ref,
    required this.verse,
    required this.arabicFontSize,
    required this.showLatin,
    required this.showTrans,
    required this.latinFontSize,
    required this.transFontSize,
  });

  final WidgetRef ref;
  final Verse verse;
  final double arabicFontSize;
  final bool showLatin;
  final bool showTrans;
  final double latinFontSize;
  final double transFontSize;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      overlapsContent: true,
      builder: (context, state) {
        int _lastVerseId = 0;
        final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
        final isVerseBookmarked = ref.read(quranBookmarkProvider.notifier).isVerseBookmarked(verse.id);

        if (state.isPinned) {
          _debouncer.run(() {
            if (verse.id != _lastVerseId) {
              // logX(
              //   'chapterId: ${chapter.id} - verseId: ${verse.id} - verseNum:${verse.number}',
              //   name: _kLogName,
              // );
              // onChanged?.call(chapter.id, verse.id);
              _lastVerseId = verse.id;
            }
          });
        }
        return GestureDetector(
          // onTap: () => onTap?.call(chapter, verse),
          child: Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 5, top: 5, bottom: 5),
              child: Column(
                spacing: 10,
                children: [
                  VerseNo(verse.number),
                  if (isVerseBookmarked) Icon(SuperIcons.mg_bookmark_fill, color: oGold),
                ],
              ),
            ),
          ),
        );
      },
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
          return Container(
            color: verse.number % 2 == 1 ? const Color(0xFFEBEBE9).whenDark(oBlack) : oWhite.whenDark(oBlack),
            child: ListView(
              primary: false,
              shrinkWrap: true,
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 50, right: 5, top: 5),
                        child: CustomText(verse.ar, fontSize: arabicFontSize),
                      ),
                      if (showLatin || showTrans)
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 5, bottom: 10),
                          child: Column(
                            spacing: 10,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              if (showLatin) ...[Text(verse.tr).size(latinFontSize).family('glyphs')],
                              if (showTrans) ...[Text(verse.idn).size(transFontSize).family('glyphs')],
                            ],
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}

class ChapterHeader extends StatelessWidget {
  const ChapterHeader({super.key, required this.ref, required this.verse});

  final WidgetRef ref;
  final Verse verse;

  @override
  Widget build(BuildContext context) {
    return SliverStickyHeader.builder(
      builder: (context, state) {
        int _lastVerseId = 0;
        final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));
        final chapter = ref.read(quranChapterProvider.notifier).getChapter(verse.chapter);
        if (state.isPinned) {
          _debouncer.run(() {
            if (verse.id != _lastVerseId) {
              // logX(
              //   'chapterId: ${chapter.id} - verseId: ${verse.id} - verseNum:${verse.number}',
              //   name: _kLogName,
              // );
              // onChanged?.call(chapter.id, verse.id);
              _lastVerseId = verse.id;
            }
          });
        }
        return Container(
          color: const Color(0xFFEBEBE9).whenDark(oBlack),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                children: [
                  SizedBox(
                    height: 60,
                    width: double.infinity,
                    child: Image.asset(join(quranAssets, 'images', 'chapter-header.png'), fit: BoxFit.fill),
                  ),
                  Positioned.fill(
                    left: context.screenWidth / 7 - 11.whenLandscape(3)!,
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: SizedBox(
                        width: 52.whenLandscape(65),
                        child: Text(
                          chapter.revelationPlace,
                        ).size(14.whenLandscape(18)!).clr(oBlack.whenDark(oWhite)).bold().center(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    child: Center(
                      child: SizedBox(
                        width: 150.whenLandscape(250),
                        child: Text(
                          chapter.translatedName,
                        ).size(16.whenLandscape(20)!).height(1).clr(oBlack.whenDark(oWhite)).bold().center(),
                      ),
                    ),
                  ),
                  Positioned.fill(
                    right: context.screenWidth / 7 + 1.whenLandscape(10)!,
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: SizedBox(
                        width: 25.whenLandscape(37),
                        child: Text(
                          "${chapter.versesCount}\nAyat",
                        ).size(14.whenLandscape(18)!).height(.9).clr(oBlack.whenDark(oWhite)).bold().center(),
                      ),
                    ),
                  ),
                ],
              ),
              if (chapter.bismillahPre) ...[
                5.height,
                Image.asset(
                  join(quranAssets, 'images', 'im_basmallah.png'),
                  fit: BoxFit.cover,
                  color: oBlack.whenDark(oWhite),
                  height: 45,
                ),
              ],
            ],
          ),
        );
      },
    );
  }
}

class PageViewPortrait extends StatelessWidget {
  const PageViewPortrait({
    super.key,
    required this.currentPage,
    required this.page,
    required this.chapterName,
    required this.juz,
    required this.hizb,
    this.showOverlay = false,
    this.isBookmarked = false,
    this.showVerseListMode = false,
    this.onTogglePressed,
  });

  final int currentPage;
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
    return Stack(
      children: [
        QuranPageInfo(chapterName: chapterName, juz: juz, hizb: hizb),
        Center(
          child: QuranPageBody(pageNo: currentPage, isRightPage: page.isRightPage),
        ),
        Positioned(
          bottom: 0,
          left: (context.screenWidth / 2) - (currentPage.toString().length * 4),
          child: SafeArea(child: QuranPageNumber(pageNo: currentPage)),
        ),
        // INNER GUT
        Positioned(
          left: page.isRightPage ? 0 : null,
          right: page.isRightPage ? null : 0,
          child: Container(
            height: context.screenHeight,
            width: 1,
            decoration: BoxDecoration(color: Colors.brown.whenDark(Colors.white)),
          ),
        ),
        // OUTER GUT
        Positioned(
          left: page.isRightPage ? null : 0,
          right: page.isRightPage ? 0 : null,
          child: Container(
            height: context.screenHeight,
            width: 10,
            decoration: BoxDecoration(color: Colors.brown.whenDark(Colors.white)),
          ),
        ),
        TopOverlay(
          page: page,
          pageNo: currentPage,
          chapterName: chapterName,
          juz: juz,
          hizb: hizb,
          showOverlay: showOverlay,
          isBookmarked: isBookmarked,
          showVerseListMode: showVerseListMode,
          onTogglePressed: onTogglePressed,
        ),
      ],
    );
  }
}

class PageViewLandscape extends StatelessWidget {
  const PageViewLandscape({
    super.key,
    required this.currentPage,
    required this.page,
    required this.chapterName,
    required this.juz,
    required this.hizb,
    required this.showOverlay,
    required this.isBookmarked,
  });

  final int currentPage;
  final QuranPage page;
  final String chapterName;
  final int juz;
  final String hizb;
  final bool showOverlay;
  final bool isBookmarked;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              QuranPageInfo(chapterName: chapterName, juz: juz, hizb: hizb),
              QuranPageBody(pageNo: currentPage, isRightPage: page.isRightPage),
              Center(child: QuranPageNumber(pageNo: currentPage)),
            ],
          ),
        ),
        // INNER GUT
        Positioned(
          left: page.isRightPage ? 0 : null,
          right: page.isRightPage ? null : 0,
          child: Container(
            height: context.screenHeight,
            width: 1,
            decoration: BoxDecoration(color: Colors.brown.whenDark(Colors.white)),
          ),
        ),
        // OUTER GUT
        Positioned(
          left: page.isRightPage ? null : 0,
          right: page.isRightPage ? 0 : null,
          child: Container(
            height: context.screenHeight,
            width: 10,
            decoration: BoxDecoration(color: Colors.brown.whenDark(Colors.white)),
          ),
        ),
        TopOverlay(
          page: page,
          pageNo: currentPage,
          chapterName: chapterName,
          juz: juz,
          hizb: hizb,
          showOverlay: showOverlay,
          isBookmarked: isBookmarked,
        ),
      ],
    );
  }
}

class QuranPageBody extends ConsumerStatefulWidget {
  const QuranPageBody({super.key, required this.pageNo, required this.isRightPage});

  final int pageNo;
  final bool isRightPage;

  @override
  ConsumerState<QuranPageBody> createState() => _QuranPageState();
}

class _QuranPageState extends ConsumerState<QuranPageBody> {
  SelectionState _selectionState = SelectionState();
  Offset? _selectionStart;
  Offset? _selectionEnd;
  bool _isSelecting = false;
  final GlobalKey _imageKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          key: _imageKey,
          onLongPressStart: _onLongPressStart,
          onLongPressMoveUpdate: _onLongPressMoveUpdate,
          onLongPressEnd: _onLongPressEnd,
          onTap: _clearSelection,
          child: InvertColor(
            isInvert: context.isDarkMode,
            child: Image.file(
              File(join(ref.read(quranAssetsLayout2Provider.notifier).appPath, 'pages', '${widget.pageNo}.png')),
              fit: BoxFit.contain,
            ),
          ),
        ),

        // Overlay untuk highlight seleksi
        if (_selectionState.selectedAreas.isNotEmpty) SelectionOverlay(selectedAreas: _selectionState.selectedAreas),

        // Toolbar yang muncul saat ada seleksi
        if (_selectionState.toolbarPosition != null)
          Positioned(
            left: _selectionState.toolbarPosition!.dx,
            top: _selectionState.toolbarPosition!.dy,
            child: SelectionToolbar(
              onBookmark: () => _handleAction('bookmark'),
              onTag: () => _handleAction('tag'),
              onShare: () => _handleAction('share'),
              onTranslate: () => _handleAction('translate'),
              onPlay: () => _handleAction('play'),
              onClose: _clearSelection,
            ),
          ),
      ],
    );
  }

  void _onLongPressStart(LongPressStartDetails details) {
    setState(() {
      _isSelecting = true;
      _selectionStart = details.localPosition;
      _selectionEnd = details.localPosition;
      _selectionState = SelectionState();

      print('_onLongPressStart_selectionStart: $_selectionStart');
      print('_onLongPressStart_selectionEnd: $_selectionEnd');
    });
  }

  void _onLongPressMoveUpdate(LongPressMoveUpdateDetails details) {
    if (!_isSelecting) return;

    setState(() {
      _selectionEnd = details.localPosition;

      // Buat rect dari start ke end
      final rect = Rect.fromPoints(_selectionStart!, _selectionEnd!);

      _selectionState = SelectionState(selectedAreas: [SelectionArea(rect: rect)]);

      print('_onLongPressMoveUpdate_selectionEnd: $_selectionEnd');
      print('_onLongPressMoveUpdate_selectionState: ${_selectionState.selectedAreas}');
    });
  }

  void _onLongPressEnd(LongPressEndDetails details) {
    if (!_isSelecting) return;

    // print('_onLongPressEnd_selectionEnd: $_selectionEnd');
    setState(() {
      _isSelecting = false;
      if (_selectionState.selectedAreas.isEmpty) return;

      print('_onLongPressEnd_selectionState: ${_selectionState.selectedAreas.first.rect}');

      // Hitung posisi toolbar (di atas seleksi)
      final rect = _selectionState.selectedAreas.first.rect;
      final toolbarY = rect.top - 60; // 60px di atas seleksi

      _selectionState = _selectionState.copyWith(
        toolbarPosition: Offset(
          rect.center.dx - 100, // Center toolbar
          toolbarY.clamp(0.0, double.infinity),
        ),
      );
    });
  }

  void _clearSelection() {
    print('ontap');
    ref.read(quranOverlayProvider.notifier).toggle();
    setState(() {
      _selectionState = SelectionState();
      _selectionStart = null;
      _selectionEnd = null;
      _isSelecting = false;
    });
  }

  void _handleAction(String action) {
    // Handle actions
    switch (action) {
      case 'bookmark':
        _showSnackBar('Bookmark ditambahkan');
        break;
      case 'tag':
        _showSnackBar('Tag ditambahkan');
        break;
      case 'share':
        _showSnackBar('Membagikan ayat...');
        break;
      case 'translate':
        _showSnackBar('Menampilkan terjemahan...');
        break;
      case 'play':
        _showSnackBar('Memutar audio...');
        break;
    }
    _clearSelection();
  }

  void _showSnackBar(String message) {
    SnackBarService(message: Center(child: Text(message).tsTitle().bold())).shown();
    // ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message), duration: const Duration(seconds: 2)));
  }
}

class InvertColor extends StatelessWidget {
  const InvertColor({super.key, required this.child, required this.isInvert});

  final Widget child;
  final bool isInvert;

  @override
  Widget build(BuildContext context) {
    if (!isInvert) return child;
    return ColorFiltered(
      colorFilter: const ColorFilter.matrix([
        -1, //RED
        0,
        0,
        0,
        255, //GREEN
        0,
        -1,
        0,
        0,
        255, //BLUE
        0,
        0,
        -1,
        0,
        255, //ALPHA
        0,
        0,
        0,
        1,
        0,
      ]),
      child: child,
    );
  }
}

class QuranPageInfo extends StatelessWidget {
  const QuranPageInfo({super.key, required this.chapterName, required this.juz, required this.hizb});

  final String chapterName;
  final int juz;
  final String hizb;

  @override
  Widget build(BuildContext context) {
    var _hizb = hizb.isEmpty ? '' : ', $hizb';
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: context.isLandscape ? 60.0 : 30.0),
      child: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            context.isLandscape
                ? Text('Surah $chapterName').tsHeadline().bold()
                : Text('Surah $chapterName').tsTitle().bold(),
            context.isLandscape
                ? Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("Juz' $juz").tsHeadline().bold(), Text(_hizb).tsHeadline().bold()],
                  )
                : Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [Text("Juz' $juz").tsTitle().bold(), Text(_hizb).tsTitle().bold()],
                  ),
          ],
        ),
      ),
    );
  }
}

class QuranPageNumber extends StatelessWidget {
  const QuranPageNumber({super.key, required this.pageNo});

  final int pageNo;

  @override
  Widget build(BuildContext context) {
    return context.isLandscape ? Text('$pageNo').tsHeadline() : Text('$pageNo').tsTitle();
  }
}

class SelectionArea {
  final Rect rect;
  final String? text;
  final int? ayahNumber;

  SelectionArea({required this.rect, this.text, this.ayahNumber});
}

class SelectionState {
  final List<SelectionArea> selectedAreas;
  final Offset? toolbarPosition;

  SelectionState({this.selectedAreas = const [], this.toolbarPosition});

  SelectionState copyWith({List<SelectionArea>? selectedAreas, Offset? toolbarPosition}) {
    return SelectionState(
      selectedAreas: selectedAreas ?? this.selectedAreas,
      toolbarPosition: toolbarPosition ?? this.toolbarPosition,
    );
  }
}

class SelectionOverlay extends StatelessWidget {
  final List<SelectionArea> selectedAreas;

  const SelectionOverlay({Key? key, required this.selectedAreas}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: CustomPaint(
        painter: SelectionPainter(selectedAreas: selectedAreas),
        size: Size.infinite,
      ),
    );
  }
}

class SelectionPainter extends CustomPainter {
  final List<SelectionArea> selectedAreas;

  SelectionPainter({required this.selectedAreas});

  @override
  void paint(Canvas canvas, Size size) {
    for (final area in selectedAreas) {
      // Draw highlight rectangle
      final paint = Paint()
        ..color = const Color(0xFF4CAF50)
            .withValues(alpha: 0.3) // Hijau transparan
        ..style = PaintingStyle.fill;

      canvas.drawRect(area.rect, paint);

      // Draw border
      final borderPaint = Paint()
        ..color = const Color(0xFF4CAF50)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 1.5;

      canvas.drawRect(area.rect, borderPaint);
    }
  }

  @override
  bool shouldRepaint(SelectionPainter oldDelegate) {
    return oldDelegate.selectedAreas != selectedAreas;
  }
}

class SelectionToolbar extends StatelessWidget {
  final VoidCallback onBookmark;
  final VoidCallback onTag;
  final VoidCallback onShare;
  final VoidCallback onTranslate;
  final VoidCallback onPlay;
  final VoidCallback onClose;

  const SelectionToolbar({
    Key? key,
    required this.onBookmark,
    required this.onTag,
    required this.onShare,
    required this.onTranslate,
    required this.onPlay,
    required this.onClose,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF2E7D32), // Hijau tua
        borderRadius: BorderRadius.circular(8),
        boxShadow: [BoxShadow(color: Colors.black.withValues(alpha: 0.2), blurRadius: 8, offset: const Offset(0, 4))],
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _ToolbarButton(icon: Icons.bookmark_border, onPressed: onBookmark),
          const SizedBox(width: 4),
          _ToolbarButton(icon: Icons.label_outline, onPressed: onTag),
          const SizedBox(width: 4),
          _ToolbarButton(icon: Icons.share, onPressed: onShare),
          const SizedBox(width: 4),
          _ToolbarButton(icon: Icons.language, onPressed: onTranslate),
          const SizedBox(width: 4),
          _ToolbarButton(icon: Icons.play_arrow, onPressed: onPlay),
          const SizedBox(width: 8),
          InkWell(
            onTap: onClose,
            child: const Icon(Icons.close, color: Colors.white, size: 20),
          ),
        ],
      ),
    );
  }
}

class _ToolbarButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onPressed;

  const _ToolbarButton({required this.icon, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      borderRadius: BorderRadius.circular(4),
      child: Padding(
        padding: const EdgeInsets.all(6),
        child: Icon(icon, color: Colors.white, size: 22),
      ),
    );
  }
}
