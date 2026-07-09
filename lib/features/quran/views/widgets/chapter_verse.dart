import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/debouncer.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/widgets/custom_ink_well.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:qareen/features/quran/views/widgets/custom_text.dart';
import 'package:qareen/features/quran/views/widgets/verse_no.dart';
import 'package:scroll_to_index/scroll_to_index.dart';
import 'package:super_icons/super_icons.dart';

import '../../utils/ui_helper.dart';

final _kLogName = 'VERSE_TILE';
int _lastVerseId = 0;
final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

class ChapterVerse extends ConsumerWidget {
  const ChapterVerse({
    super.key,
    required this.index,
    required this.autoScrollCtrl,
    required this.chapter,
    required this.verse,
    this.onTap,
    this.onChanged,
  });

  final AutoScrollController autoScrollCtrl;
  final int index;
  final Chapter chapter;
  final Verse verse;
  final Function(Chapter chapter, Verse verse)? onTap;
  final Function(int chapterId, int verseId)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final arabicFontSize = ref.watch(quranSettingProvider).arabicFontSize;
    final latinFontSize = ref.watch(quranSettingProvider).latinFontSize;
    final transFontSize = ref.watch(quranSettingProvider).transFontSize;
    final showLatin = ref.watch(quranSettingProvider).showLatin;
    final showTrans = ref.watch(quranSettingProvider).showTrans;
    final isVerseBookmarked = ref.read(quranBookmarkProvider.notifier).isVerseBookmarked(verse.id);

    return SliverStickyHeader.builder(
      overlapsContent: true,
      builder: (context, state) {
        if (state.isPinned) {
          _debouncer.run(() {
            if (verse.id != _lastVerseId) {
              logX('chapterId: ${chapter.id} - verseId: ${verse.id} - verseNum:${verse.number}', name: _kLogName);
              onChanged?.call(chapter.id, verse.id);
              _lastVerseId = verse.id;
            }
          });
        }
        return GestureDetector(
          onTap: () => onTap?.call(chapter, verse),
          child: AutoScrollTag(
            key: ValueKey(index),
            controller: autoScrollCtrl,
            index: index,
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
          ),
        );
      },
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(childCount: 1, (context, index) {
          return Container(
            color: verse.number % 2 == 1 ? const Color(0xFFEBEBE9).whenDark(oBlack) : oWhite.whenDark(oBlack),
            child: CustomInkWell(
              radius: 0,
              onTap: () => onTap?.call(chapter, verse),
              text: ListView(
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
                                if (showLatin) ...[Text(verse.tr).size(latinFontSize).family('glyphs').clr(oGold300)],
                                if (showTrans) ...[
                                  Text(verse.idn).size(transFontSize).family('glyphs').clr(oBlack.whenDark(oWhite)),
                                ],
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}
