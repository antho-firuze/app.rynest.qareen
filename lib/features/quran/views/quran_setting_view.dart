import 'package:qareen/cff/utils/log_utils.dart';
import 'package:qareen/cff/utils/my_scaffold.dart';
import 'package:qareen/cff/widgets/button/custom_action_button.dart';
import 'package:qareen/cff/widgets/button/darkmode_button.dart';
import 'package:qareen/cff/widgets/forms/group_list.dart';
import 'package:qareen/features/quran/controllers/quran_setting.dart';
import 'package:qareen/cff/widgets/custom_dropdown_dialog.dart';
import 'package:qareen/cff/utils/ui_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../utils/ui_helper.dart';

final _kLogName = 'VERSE_TILE';

class QuranSettingView extends ConsumerWidget {
  const QuranSettingView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MyScaffold(
      showConnectivityInfo: false,
      appBar: AppBar(
          title: const Text('Pengaturan'),
          actions: [
            CustomActionButton(onPressed: () => ref.read(quranSettingProvider).reset(), child: Text('Reset').bold()),
          ],
        ),
      child: ListView(
        shrinkWrap: true,
        children: [
          10.height,
          ListTile(
            title: const Text('Tampilan aplikasi').bold(),
            subtitle: const Text("Light Mode, Dark Mode atau mengikuti tema pada System").tsLabel(),
            trailing: DarkModeButton(forAppBar: false),
          ),
          20.height,
          ListTile(
            title: const Text('Buka terakhir di baca').bold(),
            subtitle: const Text("Buka halaman terakhir yang dibaca saat membuka aplikasi").tsLabel(),
            trailing: Switch(
              value: ref.watch(quranSettingProvider).autoOpenLastRead,
              onChanged: (_) async => await ref
                  .read(quranSettingProvider)
                  .setAutoOpenLastRead(!ref.watch(quranSettingProvider).autoOpenLastRead),
            ),
          ),
          20.height,
          GroupList(
            showDividerBottom: true,
            fgColor: oGold300,
            title: Text("Arabic"),
            children: [
              ListTile(
                title: const Text('Ukuran Font Arabic').bold(),
                subtitle: Text('${ref.watch(quranSettingProvider).arabicFontSize.toInt()} px'),
                onTap: () async {
                  // await showDialog(context: context, builder: (context) => const ArabicFontDialog());
                  final result = await showDialog<double>(
                    context: context,
                    builder: (context) => CustomDropdownDialog(
                      title: Text('Set Ukuran Font Arabic').tsTitle(),
                      groupValue: ref.read(quranSettingProvider).arabicFontSize,
                      keys: ['34 px', '36 px', '38 px', '40 px', '42 px'],
                      values: [34.0, 36.0, 38.0, 40.0, 42.0],
                    ),
                  );
                  if (result != null) {
                    logX('arabicFontSize: ${result}', name: _kLogName);
                    await ref.read(quranSettingProvider).setFontSize(FontType.arabic, result);
                  }
                },
              ),
            ],
          ),
          20.height,
          GroupList(
            showDividerBottom: true,
            fgColor: oGold300,
            title: Text("Bahasa Latin (Transliterasi)"),
            children: [
              ListTile(
                title: const Text('Tampilkan Bahasa Latin').bold(),
                subtitle: const Text("Tampilkan transliterasi Qur'an Bahasa Latin"),
                trailing: Switch(
                  value: ref.watch(quranSettingProvider).showLatin,
                  onChanged: (_) async =>
                      await ref.read(quranSettingProvider).setShowLatin(!ref.watch(quranSettingProvider).showLatin),
                ),
              ),
              ListTile(
                title: const Text('Ukuran Font Latin').bold(),
                subtitle: Text('${ref.watch(quranSettingProvider).latinFontSize.toInt()} px'),
                onTap: () async {
                  // return await showDialog(context: context, builder: (context) => const LatinFontDialog());
                  final result = await showDialog<double>(
                    context: context,
                    builder: (context) => CustomDropdownDialog(
                      title: Text('Set Ukuran Font Latin').tsTitle(),
                      groupValue: ref.read(quranSettingProvider).latinFontSize,
                      keys: ['22 px', '24 px', '26 px', '28 px', '30 px'],
                      values: [22.0, 24.0, 26.0, 28.0, 30.0],
                    ),
                  );
                  if (result != null) {
                    logX('latinFontSize: ${result}', name: _kLogName);
                    await ref.read(quranSettingProvider).setFontSize(FontType.latin, result);
                  }
                },
              ),
            ],
          ),
          20.height,
          GroupList(
            showDividerBottom: true,
            fgColor: oGold300,
            title: Text("Terjemahan"),
            children: [
              ListTile(
                title: const Text('Tampilkan Terjemahan').bold(),
                subtitle: const Text("Tampilkan terjemahan Qur'an Bahasa Indonesia"),
                trailing: Switch(
                  value: ref.watch(quranSettingProvider).showTrans,
                  onChanged: (_) =>
                      ref.read(quranSettingProvider).setShowTrans(!ref.watch(quranSettingProvider).showTrans),
                ),
              ),
              ListTile(
                title: const Text('Ukuran Font Terjemahan').bold(),
                subtitle: Text('${ref.watch(quranSettingProvider).transFontSize.toInt()} px'),
                onTap: () async {
                  final result = await showDialog<double>(
                    context: context,
                    builder: (context) => CustomDropdownDialog(
                      title: Text('Set Ukuran Font Terjemahan').tsTitle(),
                      groupValue: ref.read(quranSettingProvider).transFontSize,
                      keys: ['22 px', '24 px', '26 px', '28 px', '30 px'],
                      values: [22.0, 24.0, 26.0, 28.0, 30.0],
                    ),
                  );
                  if (result != null) {
                    logX('transFontSize: ${result}', name: _kLogName);
                    await ref.read(quranSettingProvider).setFontSize(FontType.trans, result);
                  }
                },
              ),
            ],
          ),
          // 20.height,
          // GroupList(showDividerBottom: true, fgColor: oGold300, title: Text("Theme Mode").bold(), children: []),
          20.height,
          GroupList(
            showDividerBottom: true,
            fgColor: oGold300,
            title: Text("Tampilan").bold(),
            children: [
              GridView.builder(
                padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 180, // Number of columns
                  // mainAxisExtent: 600,
                  crossAxisSpacing: 10, // Horizontal space between items
                  mainAxisSpacing: 10, // Vertical space between rows
                  // childAspectRatio: 1.0, // Aspect ratio (width / height)
                ),
                itemCount: 2,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return QuranLayoutSwitch(
                    selectedValue: ref.watch(quranSettingProvider).quranLayout,
                    value: index,
                    onTap: () async => await ref.read(quranSettingProvider).setLayout(index),
                  );
                },
              ),
            ],
          ),
          20.height,
        ],
      ),
    );
  }
}

class QuranLayoutSwitch extends StatelessWidget {
  const QuranLayoutSwitch({super.key, required this.selectedValue, required this.value, this.onTap});

  final int selectedValue;
  final int value;
  final Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          Card(
            color: Colors.blueAccent,
            child: Center(
              child: Text('Layout ${value + 1}', style: const TextStyle(color: Colors.white, fontSize: 18)),
            ),
          ),
          if (value == selectedValue) ...[
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.red, width: 4),
                borderRadius: BorderRadius.circular(16),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 2.0, top: 2.0),
              child: Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(shape: BoxShape.circle, color: Colors.red),
                child: Icon(Icons.check, color: Colors.white),
              ),
            ),
          ],
        ],
      ),
    );
  }
}
