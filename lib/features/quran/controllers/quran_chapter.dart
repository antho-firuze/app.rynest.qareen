import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/utils/db_quran_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_chapter.g.dart';

final _kLogName = 'QURAN-CHAPTER';

@Riverpod(keepAlive: true)
class QuranChapter extends _$QuranChapter {
  @override
  List<Chapter> build() => [];

  Future initialize() async => state = await _fetchChapters();

  Future<List<Chapter>> _fetchChapters() async {
    try {
      final data = await DBQuranHelper.instance.getChapters();
      if (data.isEmpty) return [];
      final result = data.map((e) => Chapter.fromJson(e)).toList();

      logD('fetch Chapters: ${result.length}', name: _kLogName);

      return result;
    } catch (e, s) {
      logE("Error: fetchChapters", error: e, stackTrace: s, name: _kLogName);
      return [];
    }
  }

  Chapter getChapter(int? chapterId) => state.firstWhere((chapter) => chapter.id == chapterId);

  String getChapterName(int chapterId) => state.firstWhere((chapter) => chapter.id == chapterId).name;
}
