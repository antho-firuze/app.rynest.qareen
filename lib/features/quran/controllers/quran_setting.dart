import 'package:qareen/cff/services/alert_service.dart';
import 'package:qareen/cff/services/sharedpref_service.dart';
import 'package:qareen/cff/utils/log_utils.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'quran_setting.g.dart';

// Chapter (Surah)
// Verse (Ayah)
final _kLogName = 'QURAN-SETTING';

enum FontType { arabic, latin, trans }

enum QuranLayout { layout_1, layout_2 }

@Riverpod(keepAlive: true)
QuranSetting quranSetting(Ref ref) => QuranSetting(ref);

class QuranSetting {
  Ref ref;
  QuranSetting(this.ref);

  final String _arabicFontSizeKey = 'COOKIE_ARABIC_FONT_SIZE';
  final String _latinFontSizeKey = 'COOKIE_LATIN_FONT_SIZE';
  final String _transFontSizeKey = 'COOKIE_TRANS_FONT_SIZE';
  final String _showLatinKey = 'COOKIE_SHOW_LATIN_KEY';
  final String _showTransKey = 'COOKIE_SHOW_TRANS_KEY';
  final String _autoOpenLastReadKey = 'COOKIE_AUTO_OPEN_LAST_READ_KEY';
  final String _quranLayoutKey = 'COOKIE_QURAN_LAYOUT_KEY';

  double arabicFontSize = 34.0;
  double latinFontSize = 22.0;
  double transFontSize = 22.0;
  bool showLatin = true;
  bool showTrans = true;
  bool autoOpenLastRead = true;
  int quranLayout = QuranLayout.layout_1.index;

  void initialize() {
    arabicFontSize = ref.read(sharedPrefProvider).getDouble(_arabicFontSizeKey) ?? arabicFontSize;
    latinFontSize = ref.read(sharedPrefProvider).getDouble(_latinFontSizeKey) ?? latinFontSize;
    transFontSize = ref.read(sharedPrefProvider).getDouble(_transFontSizeKey) ?? transFontSize;
    showLatin = ref.read(sharedPrefProvider).getBool(_showLatinKey) ?? showLatin;
    showTrans = ref.read(sharedPrefProvider).getBool(_showTransKey) ?? showTrans;
    autoOpenLastRead = ref.read(sharedPrefProvider).getBool(_autoOpenLastReadKey) ?? autoOpenLastRead;
    quranLayout = ref.read(sharedPrefProvider).getInt(_quranLayoutKey) ?? quranLayout;
    // logD('quranLayout: ${QuranLayout.values[quranLayout]}', name: _kLogName);
    logD('Initialize Quran Setting !', name: _kLogName);
    ref.notifyListeners();
  }

  Future reset() async {
    await AlertService.confirm(
      body: 'Anda ingin me-reset setting ?',
      onYes: () {
        setFontSize(FontType.arabic, 34.0);
        setFontSize(FontType.latin, 22.0);
        setFontSize(FontType.trans, 22.0);
        setShowLatin(true);
        setShowTrans(true);
        setAutoOpenLastRead(true);
      },
    );
  }

  Future setFontSize(FontType type, double size) async {
    switch (type) {
      case FontType.arabic:
        await ref.read(sharedPrefProvider).setDouble(_arabicFontSizeKey, size);
        arabicFontSize = size;
        logD('set arabicFontSize: $arabicFontSize', name: _kLogName);
        break;
      case FontType.latin:
        await ref.read(sharedPrefProvider).setDouble(_latinFontSizeKey, size);
        latinFontSize = size;
        logD('set latinFontSize: $latinFontSize', name: _kLogName);
        break;
      case FontType.trans:
        await ref.read(sharedPrefProvider).setDouble(_transFontSizeKey, size);
        transFontSize = size;
        logD('set transFontSize: $transFontSize', name: _kLogName);
        break;
    }
    ref.notifyListeners();
  }

  Future setShowLatin(bool val) async {
    await ref.read(sharedPrefProvider).setBool(_showLatinKey, val);
    showLatin = val;
    logD('setShowLatin: $showLatin', name: _kLogName);
    ref.notifyListeners();
  }

  Future setShowTrans(bool val) async {
    await ref.read(sharedPrefProvider).setBool(_showTransKey, val);
    showTrans = val;
    logD('setShowTrans: $showTrans', name: _kLogName);
    ref.notifyListeners();
  }

  Future setAutoOpenLastRead(bool val) async {
    await ref.read(sharedPrefProvider).setBool(_autoOpenLastReadKey, val);
    autoOpenLastRead = val;
    logD('setAutoOpenLastRead: $autoOpenLastRead', name: _kLogName);
    ref.notifyListeners();
  }

  Future setLayout(int val) async {
    await ref.read(sharedPrefProvider).setInt(_quranLayoutKey, val);
    quranLayout = QuranLayout.values[val].index;
    logD('setLayout: $quranLayout', name: _kLogName);
    ref.notifyListeners();
  }
}

// class QuranSetting {
//   late double arabicFontSize, latinFontSize, transFontSize;
//   late bool showLatin, showTrans;
// }

// @riverpod
// QuranSetting quranSetting(Ref ref) {
//   return QuranSetting()
//     ..arabicFontSize = 34.0
//     ..latinFontSize = 22.0
//     ..transFontSize = 22.0
//     ..showLatin = true
//     ..showTrans = true;
// }
