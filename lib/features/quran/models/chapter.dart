// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qareen/cff/utils/json_converter_utils.dart';

part 'chapter.freezed.dart';
part 'chapter.g.dart';

@freezed
abstract class Chapter with _$Chapter {
  factory Chapter({
    @Default(0) int id,
    @JsonKey(name: 'nameSimple') @Default('') String name,
    @JsonKey(name: 'verseCount') @Default(0) int versesCount,
    @JsonKey(name: 'bismillah') @JsonBoolConverter() @Default(true) bool bismillahPre,
    @JsonKey(name: 'revelationPlace') @Default('') String revelationPlace,
    @JsonKey(name: 'revelationOrder') @Default(0) int revelationOrder,
    @JsonKey(name: 'translated') @Default('') String translatedName,
  }) = _Chapter;

  factory Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);
}
