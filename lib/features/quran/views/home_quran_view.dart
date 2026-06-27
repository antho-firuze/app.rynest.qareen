import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qareen/cff/core/app_color.dart';
import 'package:qareen/cff/services/snackbar_service.dart';
import 'package:qareen/cff/utils/darkmode_utils.dart';
import 'package:qareen/cff/utils/debouncer.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/search_button.dart';
import 'package:qareen/features/quran/controllers/quran_page.dart';
import 'package:qareen/features/quran/utils/quran_assets_layout1.dart';
import 'package:qareen/features/quran/controllers/quran_chapter.dart';
import 'package:qareen/features/quran/controllers/quran_juz.dart';
import 'package:qareen/features/quran/controllers/quran_selection.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/features/quran/controllers/quran_verse.dart';
import 'package:qareen/features/quran/views/chapter_view.dart';
import 'package:qareen/features/quran/views/juz_view.dart';
import 'package:qareen/features/quran/views/quran_page_view.dart';
import 'package:qareen/features/quran/views/quran_search_view.dart';
import 'package:qareen/features/quran/views/quran_setting_view.dart';
import 'package:qareen/features/quran/views/bookmark_tab_view.dart';
import 'package:qareen/features/quran/views/widgets/download_asset_widget.dart';
import 'package:qareen/features/quran/views/widgets/goto_dialog.dart';
import 'package:qareen/features/quran/views/juz_tab_view.dart';
import 'package:qareen/features/quran/views/chapter_tab_view.dart';
import 'package:qareen/cff/utils/page_utils.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:super_icons/super_icons.dart';

final _kLogName = 'HOME_QURAN-VIEW';

class HomeQuranView extends ConsumerStatefulWidget {
  const HomeQuranView({super.key});

  @override
  ConsumerState<HomeQuranView> createState() => _HomeQuranViewState();
}

class _HomeQuranViewState extends ConsumerState<HomeQuranView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await ref.read(quranAssetsLayout1Provider.notifier).initialize();
      await ref.read(quranChapterProvider.notifier).initialize();
      await ref.read(quranJuzProvider.notifier).initialize();
      await ref.read(quranVerseProvider.notifier).initialize();
      await ref.read(quranPagesProvider.notifier).initialize();
      await ref.read(quranSelectionProvider.notifier).initialize();
      ref.read(quranSettingProvider).initialize();

      if (ref.read(quranSelectionProvider) != null && ref.read(quranSettingProvider).autoOpenLastRead) {
        openLastRead();
      }
    });
    super.initState();
  }

  void openLastRead() async {
    final recent = ref.read(quranSelectionProvider);
    logD('last read notes: ${recent?.notes}', name: _kLogName);
    if (ref.read(quranSettingProvider).quranLayout == 1) {
      await context.goto(page: QuranPageView());
    } else {
      if (recent?.notes == 'byChapter') {
        await context.goto(page: const ChapterView());
      } else {
        await context.goto(page: const JuzView());
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (ref.watch(quranAssetsLayout1Provider) == false) {
      return DownloadAssetWidget(
        progress: ref.watch(quranAssetsLayout1Provider.notifier).progressPercentage,
        title: ref.watch(quranAssetsLayout1Provider.notifier).progressName,
      );
    }

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;

        debugPrint('onPopInvoked');

        Debouncer(delay: Duration(milliseconds: 2000)).confirm(
          () => SnackBarService(
            message: Text('Tekan lagi untuk keluar').tsBody().center(),
          ).shown(position: SnackbarPosition.middle),
          () => context.pop(false),
        );
      },
      child: MyScaffold(
        showConnectivityInfo: false,
        appBar: AppBar(
          titleSpacing: 20,
          title: const Text("Al-Qur'an"),
          automaticallyImplyLeading: false,
          actions: [
            CustomActionButton(
              icon: const Icon(SuperIcons.ev_book_open_outline),
              onPressed: () async => openLastRead(),
            ),
            SearchButton(onPressed: () => context.goto(page: const QuranSearchView())),
            PopupMenuButton<String>(
              onSelected: (String value) async {
                switch (value) {
                  case 'settings':
                    return await context.goto(page: const QuranSettingView());
                  case 'goto':
                    return await showDialog(context: context, builder: (context) => GotoDialog());
                }
              },
              itemBuilder: (BuildContext context) => [
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 10, right: 50),
                  value: 'goto',
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(SuperIcons.bx_walk, color: Colors.black54.whenDark(null)),
                      Text('Go to Surah'),
                    ],
                  ),
                ),
                PopupMenuItem<String>(
                  padding: EdgeInsets.only(left: 10, right: 50),
                  value: 'settings',
                  child: Row(
                    spacing: 10,
                    children: [
                      Icon(Icons.settings, color: Colors.black54.whenDark(null)),
                      Text('Settings'),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
        child: DefaultTabController(
          length: 3,
          child: Material(
            child: Column(
              children: [
                TabBar(
                  labelStyle: tsTitle().clr(oGold200),
                  unselectedLabelStyle: tsTitle().clr(oGrey),
                  indicatorColor: oGold200,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicatorWeight: 4,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey,
                  tabs: const [
                    Tab(text: 'SURAH'),
                    Tab(text: 'JUZ'),
                    Tab(text: 'BOOKMARK'),
                  ],
                ),
                Expanded(child: const TabBarView(children: [ChapterTabView(), JuzTabView(), BookmarkTabView()])),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
