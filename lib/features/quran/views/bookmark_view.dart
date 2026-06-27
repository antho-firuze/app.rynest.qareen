import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/datetime_utils.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/features/quran/controllers/label_selector.dart';
import 'package:qareen/features/quran/controllers/quran_bookmark.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:qareen/features/quran/utils/ui_helper.dart';
import 'package:qareen/features/quran/views/widgets/custom_text.dart';
import 'package:qareen/features/quran/views/label_selector_view.dart';
import 'package:qareen/features/quran/views/widgets/label_widget.dart';
import 'package:qareen/features/quran/views/widgets/verse_no.dart';
import 'package:super_icons/super_icons.dart';

final _kLogName = "BOOKMARK-VIEW";

enum BookmarkAction { add, edit }

class BookmarkView extends ConsumerStatefulWidget {
  const BookmarkView({
    super.key,
    this.action = BookmarkAction.add,
    this.bookmark,
    this.chapterId,
    this.verseNo,
  });

  final BookmarkAction action;
  final Bookmark? bookmark;
  final int? chapterId;
  final int? verseNo;

  @override
  ConsumerState<BookmarkView> createState() => _BookmarkViewState();
}

class _BookmarkViewState extends ConsumerState<BookmarkView> {
  TextEditingController _notes = TextEditingController();
  late Bookmark _bookmark;

  @override
  void initState() {
    if (widget.bookmark == null) {
      final _verseId = ref.read(quranVerseProvider.notifier).getVerseId(widget.chapterId!, widget.verseNo!);
      final __juz = ref.read(quranJuzProvider.notifier).getJuzId(_verseId);
      final _page = ref.read(quranVerseProvider.notifier).getPageId(_verseId);
      _bookmark = Bookmark(
        chapterId: widget.chapterId,
        verseNo: widget.verseNo,
        verseId: _verseId,
        juz: __juz,
        page: _page,
        notes: ref.read(quranBookmarkProvider.notifier).getNote(_verseId),
        tags: ref.read(quranBookmarkProvider.notifier).getLabelsByVerse(_verseId),
      );
    } else {
      _bookmark = widget.bookmark!;
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (widget.action == BookmarkAction.add) {
        ref.read(labelSelectorProvider.notifier).load([]);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final _chapterId = _bookmark.chapterId ?? 1;
    final _chapterName = ref.read(quranChapterProvider.notifier).getChapterName(_chapterId);
    final _verse = ref.read(quranVerseProvider.notifier).getVerseById(_bookmark.verseId!);
    final _verseNo = _bookmark.verseNo;
    final _juz = _bookmark.juz;
    return MyScaffold(
      showConnectivityInfo: false,
      appBar: AppBar(
        title: const Text('Bookmark'),
        actions: [
          if (widget.action == BookmarkAction.edit)
            CustomActionButton(
              onPressed: () async {
                bool result = await ref.read(quranBookmarkProvider.notifier).delete(_bookmark);
                if (result == true && context.mounted) {
                  context.popz();
                }
              },
              child: Text('Hapus').bold(),
            ),
        ],
      ),
      child: ListView(
        shrinkWrap: true,
        // mainAxisSize: MainAxisSize.min,
        children: [
          // TITLE
          Padding(
            padding: const EdgeInsets.only(top: 20.0, bottom: 10),
            child: Center(child: Text('QS. $_chapterName $_chapterId:$_verseNo (Juz: $_juz)').tsTitle().bold()),
          ),
          // BODY
          Padding(
            padding: const EdgeInsets.only(bottom: 20.0),
            child: Column(
              spacing: 10,
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10, right: 10, top: 5),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(padding: const EdgeInsets.only(top: 10.0), child: VerseNo(_verse.number)),
                      Flexible(child: CustomText(_verse.ar, fontSize: ref.watch(quranSettingProvider).arabicFontSize)),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    spacing: 10,
                    children: [
                      if (ref.watch(quranSettingProvider).showLatin) ...[
                        Text(
                          _verse.tr,
                        ).size(ref.watch(quranSettingProvider).latinFontSize).family('glyphs').clr(oGold300),
                      ],
                      if (ref.watch(quranSettingProvider).showTrans) ...[
                        Text(_verse.idn)
                            .size(ref.watch(quranSettingProvider).transFontSize)
                            .family('glyphs')
                            .clr(oBlack.whenDark(oWhite)),
                      ],
                    ],
                  ),
                ),
              ],
            ),
          ),
          // NOTE & LABEL
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              spacing: 10,
              children: [
                CustomInput(
                  controller: _notes,
                  initialValue: _bookmark.notes,
                  hintText: 'Catatan',
                  maxLines: 5,
                  // onChanged: (val) => _bookmark = _bookmark.copyWith(notes: val),
                ),
                Consumer(
                  builder: (context, ref, child) {
                    List<String> items = ref.watch(labelSelectorProvider);
                    return Row(
                      spacing: 5,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Expanded(
                          child: SizedBox(
                            height: 30,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              shrinkWrap: true,
                              itemCount: items.length,
                              itemBuilder: (context, index) {
                                final item = items[index];
                                return GestureDetector(
                                  onTap: () => context.goto(page: LabelSelectorView()),
                                  child: LabelWidget(title: item),
                                );
                              },
                              separatorBuilder: (BuildContext context, int index) => 5.width,
                            ),
                          ),
                        ),
                        if (items.length < 1)
                          SizedBox(
                            width: 110,
                            child: CustomButton(
                              flat: true,
                              icon: Icon(SuperIcons.bs_tag),
                              child: Text('Label'),
                              onPressed: () => context.goto(page: LabelSelectorView()),
                            ),
                          ),
                      ],
                    );
                  },
                ),
              ],
            ),
          ),
          // FOOTER
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                SizedBox(
                  width: 150,
                  child: CustomButton(
                    flat: true,
                    child: Text('Tutup'),
                    onPressed: () {
                      if (context.mounted) context.popz();
                    },
                  ),
                ),
                if (widget.action == BookmarkAction.add)
                  SizedBox(
                    width: 210,
                    child: CustomButton(
                      child: Text('Tambah ke Bookmark'),
                      onPressed: () {
                        _bookmark = _bookmark.copyWith(
                          notes: _notes.text,
                          tags: ref.read(labelSelectorProvider),
                          createdAt: DateTime.now().toMilliseconds(),
                        );
                        logD("New Bookmark: $_bookmark", name: _kLogName);
                        ref.read(quranBookmarkProvider.notifier).add(_bookmark);
                        if (context.mounted) context.popz();
                      },
                    ),
                  )
                else
                  SizedBox(
                    width: 210,
                    child: CustomButton(
                      child: Text('Rubah Bookmark'),
                      onPressed: () {
                        _bookmark = _bookmark.copyWith(notes: _notes.text, tags: ref.read(labelSelectorProvider));
                        logD("Updated Bookmark: $_bookmark", name: _kLogName);
                        ref.read(quranBookmarkProvider.notifier).update(_bookmark);
                        if (context.mounted) context.popz();
                      },
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
