import 'dart:convert';
import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:qareen/cff/utils/datetime_utils.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_page.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_selection.g.dart';

final _kLogName = 'QURAN-SELECTION';

@Riverpod(keepAlive: true)
class QuranSelection extends _$QuranSelection {
  final String _selectionKey = 'COOKIE_SELECTION';

  @override
  Bookmark? build() => null;

  Future initialize() async => state = await _fetchData();

  Future<Bookmark?> _fetchData() async {
    Bookmark? recent = ref.read(sharedPrefProvider).getString(_selectionKey) != null
        ? Bookmark.fromJson(jsonDecode(ref.read(sharedPrefProvider).getString(_selectionKey)!))
        : null;

    logD('fetch Recent: ${recent != null ? 1 : 0}', name: _kLogName);

    return recent;
  }

  Future<Bookmark> lastOpened(int chapterId, {int? verseId, String note = 'byChapter'}) async {
    int _verseId = verseId ?? ref.read(quranVerseProvider.notifier).getVerseId(chapterId);
    final data = Bookmark(
      page: ref.read(quranVerseProvider.notifier).getPageId(_verseId),
      chapterId: chapterId,
      verseId: _verseId,
      verseNo: ref.read(quranVerseProvider.notifier).getVerseNum(_verseId),
      juz: ref.read(quranJuzProvider.notifier).getJuzId(_verseId),
      createdAt: DateTime.now().toMilliseconds(),
      notes: note,
    );
    ref.read(sharedPrefProvider).setString(_selectionKey, jsonEncode(data.toJson()));
    state = data;
    return data;
  }

  Future<Bookmark> lastOpenPage(int pageId, {note = 'byChapter'}) async {
    int _chapterId = ref.read(quranPagesProvider.notifier).getChapterId(pageId);
    int _verseNo = ref.read(quranPagesProvider.notifier).getVerseNo(pageId);
    int _verseId = ref.read(quranVerseProvider.notifier).getVerseId(_chapterId, _verseNo);
    final data = Bookmark(
      page: pageId,
      chapterId: _chapterId,
      verseId: _verseId,
      verseNo: _verseNo,
      juz: ref.read(quranJuzProvider.notifier).getJuzId(_verseId),
      createdAt: DateTime.now().toMilliseconds(),
      notes: note,
    );
    ref.read(sharedPrefProvider).setString(_selectionKey, jsonEncode(data.toJson()));
    state = data;
    return data;
  }
}
