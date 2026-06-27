// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => _Bookmark(
  chapterId: (json['chapterId'] as num?)?.toInt(),
  verseId: (json['verseId'] as num?)?.toInt(),
  verseNo: (json['verseNo'] as num?)?.toInt(),
  juz: (json['juz'] as num?)?.toInt(),
  page: (json['page'] as num?)?.toInt(),
  createdAt: (json['createdAt'] as num?)?.toInt(),
  notes: json['notes'] as String?,
  tags: const JsonListStringConverter().fromJson(json['tags']),
);

Map<String, dynamic> _$BookmarkToJson(_Bookmark instance) => <String, dynamic>{
  'chapterId': instance.chapterId,
  'verseId': instance.verseId,
  'verseNo': instance.verseNo,
  'juz': instance.juz,
  'page': instance.page,
  'createdAt': instance.createdAt,
  'notes': instance.notes,
  'tags': const JsonListStringConverter().toJson(instance.tags),
};
