import 'package:qareen/features/quran/models/verse.dart';
import 'package:qareen/features/quran/utils/db_quran_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_search.g.dart';

@riverpod
class QuranSearch extends _$QuranSearch {
  @override
  FutureOr<List<Verse>> build() async => [];

  Future<void> find(String searchTerm) async {
    state = AsyncValue.loading();
    final data = await DBQuranHelper.instance.search(searchTerm);
    List<Verse> bookmarks = data.map((json) => Verse.fromJson(json)).toList();
    state = AsyncData(bookmarks);
  }
}
