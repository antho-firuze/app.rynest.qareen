import 'dart:io';

import 'package:path/path.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/utils/quran_assets_layout1.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/models/chapter.dart';
import 'package:qareen/features/quran/views/chapter_view.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qareen/features/quran/views/quran_page_view.dart';

import '../utils/ui_helper.dart';

class ChapterTabView extends ConsumerWidget {
  const ChapterTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chapters = ref.watch(quranChapterProvider);

    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: chapters.length,
        itemBuilder: (context, index) {
          final chapter = chapters[index];
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                leading: ChapterNo(chapter.id),
                title: Text("Surah ${chapter.name}").tsTitle().bold(),
                subtitle: Text("${chapter.revelationPlace} | ${chapter.versesCount} Ayat").tsBody().clr(oGold300),
                trailing: ChapterName(chapter: chapter),
                onTap: () async {
                  ref.read(quranSelectionProvider.notifier).lastOpened(chapter.id);
                  if (ref.read(quranSettingProvider).quranLayout == 1) {
                    await context.goto(page: QuranPageView());
                  } else {
                    await context.goto(page: const ChapterView());
                  }
                },
              ),
              divider(padding: const EdgeInsets.symmetric(vertical: 2)),
            ],
          );
        },
      ),
    );
  }
}

class ChapterName extends ConsumerWidget {
  const ChapterName({super.key, required this.chapter});

  final Chapter chapter;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(myThemeModeProvider);
    final _assetsPath = ref.watch(quranAssetsLayout1Provider.notifier).appPath;
    return SizedBox(
      height: 35,
      width: 70,
      child: Image.file(
        File(join(_assetsPath, 'chapters', 'sname_${chapter.id}.png')),
        color: Colors.black87.whenDark(oWhite, context),
      ),
    );
  }
}

class ChapterNo extends StatelessWidget {
  const ChapterNo(this.num, {super.key});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          join(quranAssetsIcons, 'surah-number.svg'),
          // '${quranAssetsIcons}surah-number.svg',
          colorFilter: ColorFilter.mode(oGold300, BlendMode.srcIn),
        ),
        Text("$num").tsTitle().bold().center(),
      ],
    );
  }
}
