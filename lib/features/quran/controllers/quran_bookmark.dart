import 'package:qareen/cff/services/alert_service.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:qareen/features/quran/utils/db_bookmark_helper.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_bookmark.g.dart';

final _kLogName = 'QURAN-BOOKMARK';

@riverpod
Stream<List<String>> fetchTags(Ref ref) async* {
  while (true) {
    yield await DBBookmarkHelper.instance.getTags();
    await Future.delayed(Duration(milliseconds: 500));
  }
}

@Riverpod(keepAlive: true)
class TagSelection extends _$TagSelection {
  List<String> build() => [];

  void add(String label) {
    state.add(label);
    List<String> _tags = state;
    state = [..._tags];

    ref.read(quranBookmarkProvider.notifier).filterByTags(_tags);
  }

  void remove(String label) {
    state.remove(label);
    List<String> _tags = state;
    state = [..._tags];

    ref.read(quranBookmarkProvider.notifier).filterByTags(_tags);
  }
}

@riverpod
class BookmarkSearch extends _$BookmarkSearch {
  @override
  FutureOr<List<Bookmark>> build() async => [];

  Future<void> find(String searchTerm) async {
    state = AsyncValue.loading();
    final data = await DBBookmarkHelper.instance.search(searchTerm);
    List<Bookmark> bookmarks = data.map((json) => Bookmark.fromJson(json)).toList();
    state = AsyncData(bookmarks);
  }
}

@Riverpod(keepAlive: true)
class QuranBookmark extends _$QuranBookmark {
  @override
  List<Bookmark> build() => [];

  Future initialize() async => state = await _loadBookmark();

  Future<List<Bookmark>> _loadBookmark() async {
    final data = await DBBookmarkHelper.instance.read();
    // logD('loadBookmark: ${data.length}', name: _kLogName);

    return data.map((json) => Bookmark.fromJson(json)).toList();
    // return data;
  }

  bool isPageBookmarked(int page) => state.where((bookmark) => bookmark.page == page).isNotEmpty;

  bool isVerseBookmarked(int verseId) => state.where((bookmark) => bookmark.verseId == verseId).isNotEmpty;

  Future filterByTags(List<String> tags) async {
    final data = await DBBookmarkHelper.instance.filterByTags(tags);
    logD('filterByTags: ${data.length}', name: _kLogName);
    List<Bookmark> bookmarks = data.map((json) => Bookmark.fromJson(json)).toList();
    state = [...bookmarks];
  }

  String getNote(int verseId) {
    return state.firstWhere((bookmark) => bookmark.verseId == verseId, orElse: () => Bookmark()).notes ?? '';
  }

  List<String> getLabelsByVerse(int verseId) {
    final bookmark = state.firstWhere((bookmark) => bookmark.verseId == verseId, orElse: () => Bookmark());
    return bookmark.notes != null && bookmark.notes!.isNotEmpty ? [bookmark.notes!] : [];
  }

  List<String> getLabels() {
    List<String> allLabels = state.expand((item) => item.tags as List<String>).toList();
    List<String> uniqueLabels = allLabels.toSet().toList();
    uniqueLabels.sort();
    return uniqueLabels;
  }

  Future<int> add(Bookmark data) async {
    // List<Bookmark> _newBookmarks = [...state, data];
    // _newBookmarks.sort((a, b) => a.createdAt!.compareTo(b.createdAt as int));
    // state = [..._newBookmarks];
    return await DBBookmarkHelper.instance.create(data.toJson());
  }

  Future<void> update(Bookmark data) async {
    state = state.map((bookmark) => bookmark.verseId == data.verseId ? data : bookmark).toList();
    await DBBookmarkHelper.instance.update(data.toJson());
  }

  Future<bool> delete(Bookmark data) async {
    return await AlertService.confirm(
      title: 'Hapus Bookmark',
      body: 'Apakah Anda yakin ingin menghapus bookmark ini?',
      yesCaption: 'Hapus',
      noCaption: 'Batal',
    ).then((confirmed) async {
      if (confirmed == true) {
        state = state.where((bookmark) => bookmark.verseId != data.verseId).toList();
        await DBBookmarkHelper.instance.delete(data.verseId!);
        logD('Deleted Bookmark: verseId ${data.verseId}', name: _kLogName);
        return true;
      }
      return false;
    });
  }
}
