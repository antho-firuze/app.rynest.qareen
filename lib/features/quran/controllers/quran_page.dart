import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/quran_page.dart';
import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/features/quran/utils/db_quran_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_page.g.dart';

final _kLogName = 'QURAN-PAGE';

@Riverpod(keepAlive: true)
class quranPages extends _$quranPages {
  bool showVerseListMode = false;

  @override
  List<QuranPage> build() => [];

  Future initialize() async => state = await _fetchPages();

  Future<List<QuranPage>> _fetchPages() async {
    final data = await DBQuranHelper.instance.getPages();
    if (data.isEmpty) return [];
    final result = data.map((e) => QuranPage.fromJson(e)).toList();

    logD('fetch Pages: ${result.length}', name: _kLogName);

    return result;
  }

  String getHizbText(int index) {
    return index == 0
        ? ''
        : state[index - 1].hizbText == state[index].hizbText
        ? ''
        : state[index].hizbText;
  }

  String getJuzText(int index) {
    return index == 0
        ? ''
        : state[index - 1].juz == state[index].juz
        ? ''
        : 'Juz ${state[index].juz}';
  }

  int getChapterId(int pageId) => state.firstWhere((page) => page.id == pageId).startChapterId;

  int getVerseNo(int pageId) => state.firstWhere((page) => page.id == pageId).startVerseNo;

  void toggle([bool? value]) {
    showVerseListMode = value == null ? !showVerseListMode : value;
    ref.notifyListeners();
  }

  List<Verse> getVerses(int page) {
    final data = ref.read(quranVerseProvider.notifier).getVersesByPage(page);
    if (data.isEmpty) return [];

    // logD('fetch Verses: ${result.length}', name: _kLogName);

    return data;
  }
}
