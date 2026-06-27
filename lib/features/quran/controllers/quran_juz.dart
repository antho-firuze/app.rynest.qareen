import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/juz.dart';
import 'package:qareen/features/quran/utils/db_quran_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_juz.g.dart';

final _kLogName = 'QURAN-JUZ';

@Riverpod(keepAlive: true)
class QuranJuz extends _$QuranJuz {
  @override
  List<Juz> build() => [];

  Future initialize() async => state = await _fetchJuzs();

  Future<List<Juz>> _fetchJuzs() async {
    try {
      final data = await DBQuranHelper.instance.getJuzs();
      if (data.isEmpty) return [];

      final result = data.map((e) => Juz.fromJson(e)).toList();
      logD('fetch Juzs: ${result.length}', name: _kLogName);

      return result;
    } catch (e, s) {
      logE("Error : fetchJuzs", error: e, stackTrace: s, name: _kLogName);
      return [];
    }
  }

  Juz getJuz(int juzId) => state.firstWhere((juz) => juz.id == juzId);

  int getJuzId(int verseId) => ref.read(quranVerseProvider).firstWhere((verse) => verse.id == verseId).juz;

  int getChapterIdByJuz(int juzId) => state.firstWhere((juz) => juz.id == juzId).startChapterId;
}
