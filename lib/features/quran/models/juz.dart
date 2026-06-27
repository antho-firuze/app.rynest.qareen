// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'juz.freezed.dart';
part 'juz.g.dart';

@freezed
abstract class Juz with _$Juz {
  factory Juz({
    @Default(0) int id,
    @JsonKey(name: 'firstVerseId') @Default(0) int firstVerseId,
    @JsonKey(name: 'lastVerseId') @Default(0) int lastVerseId,
    @JsonKey(name: 'verseCount') @Default(0) int versesCount,
    @JsonKey(name: 'startChapterId') @Default(0) int startChapterId,
    @JsonKey(name: 'startVerseNo') @Default(0) int startVerseNo,
  }) = _Juz;

  factory Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);
}