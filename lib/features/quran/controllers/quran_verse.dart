import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/features/quran/utils/db_quran_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_verse.g.dart';

final _kLogName = 'QURAN-VERSE';

@Riverpod(keepAlive: true)
class QuranVerse extends _$QuranVerse {
  @override
  List<Verse> build() => [];

  Future initialize() async => state = await _fetchVerses();

  Future<List<Verse>> _fetchVerses() async {
    final data = await DBQuranHelper.instance.getVerses();
    if (data.isEmpty) return [];
    final result = data.map((e) => Verse.fromJson(e)).toList();

    logD('fetch Chapters: ${result.length}', name: _kLogName);

    return result;
  }

  List<Verse> getVerses(int chapterId) => state.where((verse) => verse.chapter == chapterId).toList();

  List<Verse> getVersesByPage(int page) => state.where((verse) => verse.page == page).toList();

  int getChapterId(int verseId) => state.firstWhere((verse) => verse.id == verseId).chapter;

  int getVerseId(int chapterId, [int verseNum = 1]) =>
      state.firstWhere((verse) => verse.chapter == chapterId && verse.number == verseNum).id;

  int getVerseNum(int verseId) => state.firstWhere((verse) => verse.id == verseId).number;

  int getVerseIdByJuz(int juzId) => state.firstWhere((verse) => verse.juz == juzId).id;

  List<Verse> getVersesByJuz(int juzId) => state.where((verse) => verse.juz == juzId).toList();

  // For BookmarkTabView
  Verse getVerseById(int verseId) => state.firstWhere((verse) => verse.id == verseId);

  Verse getVerseByPage(int page) => state.firstWhere((verse) => verse.page == page);

  int getPageId(int verseId) => state.firstWhere((verse) => verse.id == verseId).page;

  int getJuzId(int chapterId, int verseNo) =>
      state.firstWhere((verse) => verse.chapter == chapterId && verse.number == verseNo).juz;
}
