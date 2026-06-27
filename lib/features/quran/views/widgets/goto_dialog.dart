import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/string_utils.dart';
import 'package:qareen/cff/widgets/button/custom_button.dart';
import 'package:qareen/cff/widgets/custom_dialog.dart';
import 'package:qareen/cff/widgets/custom_input.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_goto.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/models/bookmark.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/views/chapter_view.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:super_icons/super_icons.dart';

import '../../utils/custom_range_text_input_formatter.dart';

final _kLogName = 'GOTO_DIALOG';

class GotoDialog extends ConsumerStatefulWidget {
  GotoDialog({super.key, this.chapterId, this.verseNum});

  final int? chapterId;
  final int? verseNum;

  @override
  ConsumerState<GotoDialog> createState() => _GotoDialogState();
}

class _GotoDialogState extends ConsumerState<GotoDialog> {
  final _formStateKey = GlobalKey<FormState>();
  final _verseController = TextEditingController();
  final _focusNode = FocusNode();
  late List<Chapter> _chapters;
  late Bookmark? _goto;
  late Chapter _chapter;
  late int _chapterId;
  late int _verseNum;

  @override
  void initState() {
    logX("Initstate goto", name: _kLogName);
    _chapters = ref.read(quranChapterProvider);
    _goto = ref.read(quranGotoProvider);
    _verseController.text = '';
    _chapterId = _goto?.chapterId ?? 1;
    _verseNum = _goto?.verseNo ?? 1;
    _chapter = ref.read(quranChapterProvider.notifier).getChapter(_chapterId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CustomDialog(
      leading: const Icon(SuperIcons.bx_walk, color: oBlack),
      title: const Text('Pergi ke Surah').tsTitle().bold(),
      content: Form(
        key: _formStateKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // SELECT CHAPTER
            DropdownButton(
              items: List.generate(
                _chapters.length,
                (index) => DropdownMenuItem(
                  value: _chapters[index].id,
                  child: Text("${_chapters[index].id}. ${_chapters[index].name}"),
                ),
              ),
              value: _chapterId,
              onChanged: (value) {
                setState(() {
                  logX("Chapter: $value", name: _kLogName);
                  _verseController.text = '';
                  _chapterId = value!;
                  _focusNode.nextFocus();
                  _chapter = ref.read(quranChapterProvider.notifier).getChapter(_chapterId);
                });
              },
            ),
            5.height,
            // SELECT VERSE
            Column(
              children: [
                Text('Masukkan nomor ayat antara 1-${_chapter.versesCount}'),
                10.height,
                CustomInput(
                  controller: _verseController,
                  focusNode: _focusNode,
                  textInputAction: TextInputAction.done,
                  keyboardType: TextInputType.number,
                  showCaptionFromHint: false,
                  hintText: "1-${_chapter.versesCount}",
                  onChanged: (value) {
                    logX("Verse: $value", name: _kLogName);
                  },
                  formatter: [
                    FilteringTextInputFormatter.allow(RegExp("[0-9]")),
                    CustomRangeTextInputFormatter(minVal: 1, maxVal: _chapter.versesCount),
                  ],
                  validator: (val) => val == null || val.isEmpty ? 'Nomor Ayat harus di isi' : null,
                ),
              ],
            ),
          ],
        ),
      ),
      actions: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 100,
              child: CustomButton(flat: true, child: const Text('BATAL'), onPressed: () => context.popz()),
            ),
            SizedBox(
              width: 100,
              child: CustomButton(
                onPressed: () async {
                  if (_formStateKey.currentState!.validate() == false) {
                    return;
                  }

                  _verseNum = _verseController.text.toInt();
                  int _verseId = ref.read(quranVerseProvider.notifier).getVerseId(_chapterId, _verseNum);

                  ref.read(quranGotoProvider.notifier).selectByChapterVerseNum(_chapterId, _verseNum);
                  ref.read(quranSelectionProvider.notifier).lastOpened(_chapterId, verseId: _verseId);
                  logX("Goto: Chapter: ${_chapterId}, verseId: ${_verseId}, Verse:${_verseNum}", name: _kLogName);
                  return await context.goto(page: const ChapterView());
                },
                child: const Text('OK'),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
