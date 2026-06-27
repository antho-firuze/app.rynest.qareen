// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Verse _$VerseFromJson(Map<String, dynamic> json) => _Verse(
  id: (json['id'] as num?)?.toInt() ?? 0,
  chapter: (json['chapterId'] as num?)?.toInt() ?? 0,
  number: (json['verseNo'] as num?)?.toInt() ?? 0,
  juz: (json['juz'] as num?)?.toInt() ?? 0,
  page: (json['page'] as num?)?.toInt() ?? 0,
  ar: json['arabic'] as String? ?? '',
  tr: json['latin'] as String? ?? '',
  idn: json['indo'] as String? ?? '',
);

Map<String, dynamic> _$VerseToJson(_Verse instance) => <String, dynamic>{
  'id': instance.id,
  'chapterId': instance.chapter,
  'verseNo': instance.number,
  'juz': instance.juz,
  'page': instance.page,
  'arabic': instance.ar,
  'latin': instance.tr,
  'indo': instance.idn,
};
