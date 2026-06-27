// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'juz.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Juz _$JuzFromJson(Map<String, dynamic> json) => _Juz(
  id: (json['id'] as num?)?.toInt() ?? 0,
  firstVerseId: (json['firstVerseId'] as num?)?.toInt() ?? 0,
  lastVerseId: (json['lastVerseId'] as num?)?.toInt() ?? 0,
  versesCount: (json['verseCount'] as num?)?.toInt() ?? 0,
  startChapterId: (json['startChapterId'] as num?)?.toInt() ?? 0,
  startVerseNo: (json['startVerseNo'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$JuzToJson(_Juz instance) => <String, dynamic>{
  'id': instance.id,
  'firstVerseId': instance.firstVerseId,
  'lastVerseId': instance.lastVerseId,
  'verseCount': instance.versesCount,
  'startChapterId': instance.startChapterId,
  'startVerseNo': instance.startVerseNo,
};
