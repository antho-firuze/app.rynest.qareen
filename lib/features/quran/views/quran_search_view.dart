import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/cff/widgets/search_text_highlight.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_search.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/views/chapter_view.dart';
import 'package:super_icons/super_icons.dart';

import '../utils/ui_helper.dart';

final _kLogName = 'QURAN-SEARCH_VIEW';

class QuranSearchView extends ConsumerStatefulWidget {
  const QuranSearchView({super.key});

  @override
  ConsumerState<QuranSearchView> createState() => _QuranSearchViewState();
}

class _QuranSearchViewState extends ConsumerState<QuranSearchView> {
  TextEditingController _findTerm = TextEditingController();

  @override
  Widget build(BuildContext context) {
    print('Quran Search Build: ${_findTerm.text}');
    return MyScaffold(
      showConnectivityInfo: false,
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: CustomInput(
            autoFocus: true,
            controller: _findTerm,
            height: 40,
            hintText: 'Cari di Al-Quran',
            autoLabel: false,
            suffixIcon: Icon(SuperIcons.bs_search),
            borderRadius: 25,
            foregroundColor: Colors.white,
            iconColor: Colors.white,
            borderSide: BorderSide(color: Colors.white),
            onChanged: (val) async {
              await ref.read(quranSearchProvider.notifier).find(val);
            },
          ),
        ),
      ),
      child: ref
          .watch(quranSearchProvider)
          .when(
            data: (data) {
              final verses = data;

              if (verses.isEmpty && _findTerm.text.isNotEmpty) {
                return Center(
                  child: Column(
                    spacing: 30,
                    mainAxisSize: MainAxisSize.min,
                    children: [Icon(Icons.search, size: 100), Text('Tidak ada kata yang cocok').tsBody()],
                  ),
                );
              }

              // logX('findTerm: ${_findTerm.text}', name: _kLogName);

              return ListView.builder(
                shrinkWrap: true,
                itemCount: verses.length,
                itemBuilder: (context, index) {
                  final verse = verses[index];
                  final chapterId = verse.chapter;
                  final chapterName = ref.read(quranChapterProvider.notifier).getChapterName(chapterId);
                  final verseNum = verse.number;
                  final juzNum = verse.juz;
                  final verseId = verse.id;
                  return ListTile(
                    contentPadding: const EdgeInsets.only(left: 20, right: 5),
                    leading: const Icon(SuperIcons.bs_book_half, color: oGold200),
                    title: SearchTextHighlight(text: verse.idn, query: _findTerm.text),
                    subtitle: Text("QS. $chapterName $chapterId : Ayat $verseNum (Juz: $juzNum)").tsBody(),
                    // trailing: IconButton(
                    //   tooltip: 'Hapus',
                    //   icon: Icon(SuperIcons.bs_bookmark_x, color: oGold300),
                    //   onPressed: () => ref.read(quranBookmarkProvider.notifier).delete(bookmark),
                    // ),
                    onTap: () async {
                      logX('ChapterId : $chapterId - VerseNum : $verseNum -  VerseId : $verseId', name: _kLogName);
                      ref.read(quranSelectionProvider.notifier).lastOpened(chapterId, verseId: verseId);
                      await context.goto(page: const ChapterView());
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
