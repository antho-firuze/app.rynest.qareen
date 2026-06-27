import 'package:path/path.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/views/juz_view.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:qareen/features/quran/views/quran_page_view.dart';

import '../utils/ui_helper.dart';

class JuzTabView extends ConsumerWidget {
  const JuzTabView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final juzs = ref.watch(quranJuzProvider);

    return Scrollbar(
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: juzs.length,
        itemBuilder: (context, index) {
          final juz = juzs[index];
          final chapterName = ref.read(quranChapterProvider.notifier).getChapterName(juz.startChapterId);
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                contentPadding: const EdgeInsets.only(left: 10, right: 10),
                leading: JuzNo(num: juz.id),
                title: Text("Juz ${juz.id}").tsTitle().bold(),
                subtitle: Text("Mulai di Surah ${chapterName} Ayat ${juz.startVerseNo}").tsBody(),
                onTap: () async {
                  await ref
                      .read(quranSelectionProvider.notifier)
                      .lastOpened(juz.startChapterId, verseId: juz.firstVerseId, note: 'byJuz');
                  if (ref.read(quranSettingProvider).quranLayout == 1) {
                    await context.goto(page: QuranPageView());
                  } else {
                    await context.goto(page: const JuzView());
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

class JuzNo extends StatelessWidget {
  const JuzNo({super.key, required this.num});

  final int num;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        SvgPicture.asset(
          join(quranAssetsIcons, 'surah-number.svg'),
          colorFilter: ColorFilter.mode(oGold300, BlendMode.srcIn),
        ),
        Text("$num").tsTitle().bold().center(),
      ],
    );
  }
}
