import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/features/quran/controllers/label_selector.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/views/bookmark_view.dart';
import 'package:qareen/features/quran/views/widgets/label_widget.dart';
import 'package:super_icons/super_icons.dart';

import '../utils/ui_helper.dart';

final _kLogName = 'BOOKMARK-SEARCH_VIEW';

class BookmarkSearchView extends ConsumerStatefulWidget {
  const BookmarkSearchView({super.key});

  @override
  ConsumerState<BookmarkSearchView> createState() => _BookmarkSearchViewState();
}

class _BookmarkSearchViewState extends ConsumerState<BookmarkSearchView> {
  TextEditingController _findTerm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MyScaffold(
      showConnectivityInfo: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomInput(
            autoFocus: true,
            controller: _findTerm,
            height: 40,
            hintText: 'Cari Bookmark',
            autoLabel: false,
            suffixIcon: Icon(SuperIcons.bs_search),
            borderRadius: 25,
            foregroundColor: Colors.white,
            iconColor: Colors.white,
            borderSide: BorderSide(color: Colors.white),
            onChanged: (val) async {
              await ref.read(bookmarkSearchProvider.notifier).find(val);
            },
            onSubmitted: (val) async {
              // await ref.read(productListProvider.notifier).searchData(val);
              // controller.jumpTo(0);
            },
          ),
        ),
      ),
      child: ref
          .watch(bookmarkSearchProvider)
          .when(
            data: (data) {
              final bookmarks = data;

              if (bookmarks.isEmpty && _findTerm.text.isNotEmpty) {
                return Center(
                  child: Column(
                    spacing: 30,
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.search, size: 100), Text('Tidak ada catatan yang cocok').tsBody()],
                  ),
                );
              }

              return ListView.builder(
                shrinkWrap: true,
                itemCount: bookmarks.length,
                itemBuilder: (context, index) {
                  final bookmark = bookmarks[index];
                  final chapterId = bookmark.chapterId ?? 1;
                  final chapterName = ref.read(quranChapterProvider.notifier).getChapterName(chapterId);
                  final verseNum = bookmark.verseNo;
                  final juzNum = bookmark.juz;
                  final verseId = bookmark.verseId;
                  Widget? _note = bookmark.notes == null || bookmark.notes!.isEmpty
                      ? null
                      : Text(bookmark.notes!).maxLn(2).ellipsis().tsBody().clr(const Color(0xFF5E4905));
                  Widget? _label = bookmark.tags == null || bookmark.tags!.isEmpty
                      ? null
                      : Padding(
                          padding: const EdgeInsets.only(top: 5.0),
                          child: SizedBox(
                            height: 25,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: bookmark.tags!.length,
                              itemBuilder: (context, index) => LabelWidget(title: bookmark.tags?[index] ?? ''),
                              separatorBuilder: (BuildContext context, int index) => 5.width,
                            ),
                          ),
                        );
                  Widget? _subTitle = Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [_note ?? SizedBox(), _label ?? SizedBox()],
                  );
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 20, right: 5),
                    leading: const Icon(SuperIcons.bs_book_half, color: oGold200),
                    title: Text("QS. $chapterName $chapterId : Ayat $verseNum (Juz: $juzNum)").tsTitle().bold(),
                    subtitle: _note == null && _label == null ? null : _subTitle,
                    // trailing: IconButton(
                    //   tooltip: 'Hapus',
                    //   icon: Icon(SuperIcons.bs_bookmark_x, color: oGold300),
                    //   onPressed: () => ref.read(quranBookmarkProvider.notifier).delete(bookmark),
                    // ),
                    onTap: () async {
                      logX('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: _kLogName);
                      // ref.read(quranSelectionProvider.notifier).lastOpened(chapterId, verseId: verseId);
                      ref.read(labelSelectorProvider.notifier).load(bookmark.tags ?? []);
                      logD("tags: ${bookmark.tags}", name: _kLogName);
                      await context.goto(
                        page: BookmarkView(action: BookmarkAction.edit, bookmark: bookmark),
                      );
                    },
                  );
                },
              );
            },
            error: (error, stackTrace) => Center(child: Text(error.toString()).tsBody()),
            loading: () => Center(child: CircularProgressIndicator()),
          ),
    );
  }
}
