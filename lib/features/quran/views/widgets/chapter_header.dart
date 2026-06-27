import 'package:path/path.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/debouncer.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

final _kLogName = 'CHAPTER_HEADER';
int _lastVerseId = 0;
final _debouncer = Debouncer(delay: const Duration(milliseconds: 500));

class ChapterHeader extends ConsumerWidget {
  const ChapterHeader({
    super.key,
    required this.index,
    required this.autoScrollCtrl,
    required this.chapter,
    required this.verse,
    this.onChanged,
  });

  final AutoScrollController autoScrollCtrl;
  final int index;
  final Chapter chapter;
  final Verse verse;
  final Function(int chapterId, int verseId)? onChanged;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverStickyHeader.builder(
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
        return AutoScrollTag(
          key: ValueKey(index),
          controller: autoScrollCtrl,
          index: index,
          child: Container(
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
          ),
        );
      },
    );
  }
}
