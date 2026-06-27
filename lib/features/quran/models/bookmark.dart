import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:qareen/cff/utils/json_converter_utils.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
abstract class Bookmark with _$Bookmark {
  factory Bookmark({
    int? chapterId,
    int? verseId,
    int? verseNo,
    int? juz,
    int? page,
    int? createdAt,
    String? notes,
    @JsonListStringConverter() List<String>? tags,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);
}
