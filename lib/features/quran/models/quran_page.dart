import 'package:freezed_annotation/freezed_annotation.dart';

part 'quran_page.freezed.dart';
part 'quran_page.g.dart';

@freezed
abstract class QuranPage with _$QuranPage {
  factory QuranPage({
    @Default(1) int id,
    @Default(1) int startChapterId,
    @Default(1) int startVerseNo,
    @Default(1) int endChapterId,
    @Default(1) int endVerseNo,
    @Default(1) int hizbQuarter,
  }) = _Page;

  factory QuranPage.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);
}

extension PageExt on QuranPage {
  int get hizb => (hizbQuarter / 4).fixedRound;

  int get juz => (hizbQuarter / 8).fixedRound;

  bool get isRightPage => id % 2 != 0;

  String get hizbText => switch (hizbQuarter % 4) {
    2 => '¼ Hizb $hizb',
    3 => '½ Hizb $hizb',
    0 => '¾ Hizb $hizb',
    _ => 'Hizb $hizb',
  };
}

extension Round on double {
  int get fixedRound {
    if (this == roundToDouble()) return toInt();
    return toInt() + 1;
  }
}
