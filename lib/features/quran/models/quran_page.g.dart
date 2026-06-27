// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'quran_page.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Page _$PageFromJson(Map<String, dynamic> json) => _Page(
  id: (json['id'] as num?)?.toInt() ?? 1,
  startChapterId: (json['startChapterId'] as num?)?.toInt() ?? 1,
  startVerseNo: (json['startVerseNo'] as num?)?.toInt() ?? 1,
  endChapterId: (json['endChapterId'] as num?)?.toInt() ?? 1,
  endVerseNo: (json['endVerseNo'] as num?)?.toInt() ?? 1,
  hizbQuarter: (json['hizbQuarter'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$PageToJson(_Page instance) => <String, dynamic>{
  'id': instance.id,
  'startChapterId': instance.startChapterId,
  'startVerseNo': instance.startVerseNo,
  'endChapterId': instance.endChapterId,
  'endVerseNo': instance.endVerseNo,
  'hizbQuarter': instance.hizbQuarter,
};
