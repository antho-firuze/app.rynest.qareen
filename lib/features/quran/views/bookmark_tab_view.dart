import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/widgets/button/search_button.dart';
import 'package:qareen/cff/widgets/forms/group_list.dart';
import 'package:qareen/features/quran/controllers/label_selector.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/views/bookmark_search_view.dart';
import 'package:qareen/features/quran/views/bookmark_view.dart';
import 'package:qareen/features/quran/views/chapter_view.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/features/quran/views/juz_view.dart';
import 'package:qareen/features/quran/views/quran_page_view.dart';
import 'package:qareen/features/quran/views/widgets/label_widget.dart';
import 'package:super_icons/super_icons.dart';

import '../utils/ui_helper.dart';

final _kLogName = 'BOOKMARK-TAB';

class BookmarkTabView extends ConsumerStatefulWidget {
  const BookmarkTabView({super.key});

  @override
  ConsumerState<BookmarkTabView> createState() => _BookmarkTabViewState();
}

class _BookmarkTabViewState extends ConsumerState<BookmarkTabView> {
  @override
  void initState() {
    // print('init bookmark tab view');
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(quranBookmarkProvider.notifier).initialize();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recent = ref.watch(quranSelectionProvider);

    var chapterId = 1;
    var chapterName = '';
    var verseNum = 0;
    var juzNum = 0;
    var verseId = 0;

    if (recent != null) {
      chapterId = recent.chapterId!;
      chapterName = ref.read(quranChapterProvider.notifier).getChapterName(chapterId);
      verseNum = recent.verseNo ?? 1;
      juzNum = recent.juz ?? 1;
      verseId = recent.verseId!;
    }

    return Scrollbar(
      child: ListView(
        children: [
          if (recent != null) ...[
            ListTile(
              contentPadding: const EdgeInsets.only(left: 20, right: 20),
              leading: Icon(SuperIcons.bs_book_half, color: oGold200),
              title: const Text("Terakhir Baca").tsTitle().bold(),
              subtitle: Text(" QS. $chapterName $chapterId : Ayat $verseNum").tsBody().clr(oGold300),
              trailing: Column(children: [Text("Juz").tsBody(), Text("$juzNum").tsHeadline().bold()]),
              onTap: () async {
                logX('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: _kLogName);
                // ref.read(quranSelectionProvider.notifier).selectByChapter(chapterId, verseId);
                if (ref.read(quranSettingProvider).quranLayout == 1) {
                  await context.goto(page: QuranPageView());
                } else {
                  if (recent.notes == 'byChapter') {
                    await context.goto(page: const ChapterView());
                  } else {
                    await context.goto(page: const JuzView());
                  }
                }
              },
            ),
          ],
          // if (bookmarks.isNotEmpty) ...[
          GroupList(
            showDividerTop: true,
            title: Text('Bookmark'),
            actions: [
              SearchButton(forAppBar: false, onPressed: () => context.goto(page: BookmarkSearchView())),
              // MoreButton(forAppBar: false, onPressed: () => print('More Button')),
            ],
          ),
          // LIST ALL LABEL
          Consumer(
            builder: (context, ref, child) {
              ref.watch(tagSelectionProvider);
              return ref
                  .watch(fetchTagsProvider)
                  .when(
                    data: (data) {
                      if (data.isEmpty) {
                        return SizedBox();
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 5.0),
                        child: SizedBox(
                          height: 35,
                          child: ListView.separated(
                            padding: EdgeInsets.only(left: 10.0, right: 10.0),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemCount: data.length,
                            itemBuilder: (context, index) => FilterChip(
                              label: Text(data[index]),
                              selected: ref.read(tagSelectionProvider).contains(data[index]),
                              onSelected: (bool value) {
                                if (value) {
                                  ref.read(tagSelectionProvider.notifier).add(data[index]);
                                } else {
                                  ref.read(tagSelectionProvider.notifier).remove(data[index]);
                                }
                                logX('_selected: ${ref.read(tagSelectionProvider)}', name: _kLogName);
                              },
                            ),
                            separatorBuilder: (BuildContext context, int index) => 5.width,
                          ),
                        ),
                      );
                    },
                    error: (error, stackTrace) => SizedBox(),
                    loading: () => SizedBox(),
                  );
            },
          ),
          // LIST OF BOOKMARK
          Consumer(
            builder: (context, ref, child) {
              final bookmarks = ref.watch(quranBookmarkProvider);
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
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      ListTile(
                        contentPadding: const EdgeInsets.only(left: 20, right: 10),
                        leading: const Icon(SuperIcons.mg_bookmark_fill, color: oGold200),
                        title: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("QS. $chapterName [$chapterId:$verseNum]").tsTitle().bold(),
                            Text("Page ${bookmark.page} - Juz' $juzNum").tsTitle(),
                          ],
                        ),
                        subtitle: _note == null && _label == null ? null : _subTitle,
                        onTap: () async {
                          logX('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: _kLogName);
                          ref.read(labelSelectorProvider.notifier).load(bookmark.tags ?? []);
                          logD("tags: ${bookmark.tags}", name: _kLogName);
                          await context.goto(
                            page: BookmarkView(action: BookmarkAction.edit, bookmark: bookmark),
                          );
                        },
                      ),
                      divider(padding: const EdgeInsets.symmetric(vertical: 2)),
                    ],
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
