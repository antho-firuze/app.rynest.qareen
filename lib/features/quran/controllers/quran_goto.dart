import 'package:qareen/cff/utils/datetime_utils.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_goto.g.dart';

final _kLogName = 'QURAN-GOTO';

@Riverpod(keepAlive: true)
class QuranGoto extends _$QuranGoto {
  @override
  Bookmark? build() => null;

  Bookmark selectByChapterVerseNum(int chapterId, [int verseNum = 1]) {
    int _verseId = ref.read(quranVerseProvider.notifier).getVerseId(chapterId, verseNum);
    final data = Bookmark(
      chapterId: chapterId,
      verseId: _verseId,
      verseNo: verseNum,
      juz: ref.read(quranJuzProvider.notifier).getJuzId(_verseId),
      createdAt: DateTime.now().toMilliseconds(),
    );
    state = data;
    return data;
  }
}
