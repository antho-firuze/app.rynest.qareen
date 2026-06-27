// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Chapter _$ChapterFromJson(Map<String, dynamic> json) => _Chapter(
  id: (json['id'] as num?)?.toInt() ?? 0,
  name: json['nameSimple'] as String? ?? '',
  versesCount: (json['verseCount'] as num?)?.toInt() ?? 0,
  bismillahPre: json['bismillah'] == null
      ? true
      : const JsonBoolConverter().fromJson(json['bismillah']),
  revelationPlace: json['revelationPlace'] as String? ?? '',
  revelationOrder: (json['revelationOrder'] as num?)?.toInt() ?? 0,
  translatedName: json['translated'] as String? ?? '',
);

Map<String, dynamic> _$ChapterToJson(_Chapter instance) => <String, dynamic>{
  'id': instance.id,
  'nameSimple': instance.name,
  'verseCount': instance.versesCount,
  'bismillah': const JsonBoolConverter().toJson(instance.bismillahPre),
  'revelationPlace': instance.revelationPlace,
  'revelationOrder': instance.revelationOrder,
  'translated': instance.translatedName,
};
