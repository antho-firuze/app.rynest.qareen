// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'verse.freezed.dart';
part 'verse.g.dart';

@freezed
abstract class Verse with _$Verse {

  factory Verse({
    @Default(0) int id,
    @JsonKey(name: 'chapterId') @Default(0) int chapter,
    @JsonKey(name: 'verseNo') @Default(0) int number,
    @JsonKey(name: 'juz') @Default(0) int juz,
    @JsonKey(name: 'page') @Default(0) int page,
    @JsonKey(name: 'arabic') @Default('') String ar,
    @JsonKey(name: 'latin') @Default('') String tr,
    @JsonKey(name: 'indo') @Default('') String idn,
  }) = _Verse;

  factory Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);
}