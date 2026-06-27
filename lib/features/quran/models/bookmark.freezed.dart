// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bookmark.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Bookmark {

 int? get chapterId; int? get verseId; int? get verseNo; int? get juz; int? get page; int? get createdAt; String? get notes;@JsonListStringConverter() List<String>? get tags;
/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookmarkCopyWith<Bookmark> get copyWith => _$BookmarkCopyWithImpl<Bookmark>(this as Bookmark, _$identity);

  /// Serializes this Bookmark to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Bookmark&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.verseId, verseId) || other.verseId == verseId)&&(identical(other.verseNo, verseNo) || other.verseNo == verseNo)&&(identical(other.juz, juz) || other.juz == juz)&&(identical(other.page, page) || other.page == page)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other.tags, tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,verseId,verseNo,juz,page,createdAt,notes,const DeepCollectionEquality().hash(tags));

@override
String toString() {
  return 'Bookmark(chapterId: $chapterId, verseId: $verseId, verseNo: $verseNo, juz: $juz, page: $page, createdAt: $createdAt, notes: $notes, tags: $tags)';
}


}

/// @nodoc
abstract mixin class $BookmarkCopyWith<$Res>  {
  factory $BookmarkCopyWith(Bookmark value, $Res Function(Bookmark) _then) = _$BookmarkCopyWithImpl;
@useResult
$Res call({
 int? chapterId, int? verseId, int? verseNo, int? juz, int? page, int? createdAt, String? notes,@JsonListStringConverter() List<String>? tags
});




}
/// @nodoc
class _$BookmarkCopyWithImpl<$Res>
    implements $BookmarkCopyWith<$Res> {
  _$BookmarkCopyWithImpl(this._self, this._then);

  final Bookmark _self;
  final $Res Function(Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? chapterId = freezed,Object? verseId = freezed,Object? verseNo = freezed,Object? juz = freezed,Object? page = freezed,Object? createdAt = freezed,Object? notes = freezed,Object? tags = freezed,}) {
  return _then(_self.copyWith(
chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int?,verseId: freezed == verseId ? _self.verseId : verseId // ignore: cast_nullable_to_non_nullable
as int?,verseNo: freezed == verseNo ? _self.verseNo : verseNo // ignore: cast_nullable_to_non_nullable
as int?,juz: freezed == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}

}


/// Adds pattern-matching-related methods to [Bookmark].
extension BookmarkPatterns on Bookmark {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Bookmark value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Bookmark value)  $default,){
final _that = this;
switch (_that) {
case _Bookmark():
return $default(_that);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Bookmark value)?  $default,){
final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? chapterId,  int? verseId,  int? verseNo,  int? juz,  int? page,  int? createdAt,  String? notes, @JsonListStringConverter()  List<String>? tags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.chapterId,_that.verseId,_that.verseNo,_that.juz,_that.page,_that.createdAt,_that.notes,_that.tags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? chapterId,  int? verseId,  int? verseNo,  int? juz,  int? page,  int? createdAt,  String? notes, @JsonListStringConverter()  List<String>? tags)  $default,) {final _that = this;
switch (_that) {
case _Bookmark():
return $default(_that.chapterId,_that.verseId,_that.verseNo,_that.juz,_that.page,_that.createdAt,_that.notes,_that.tags);case _:
  throw StateError('Unexpected subclass');

}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? chapterId,  int? verseId,  int? verseNo,  int? juz,  int? page,  int? createdAt,  String? notes, @JsonListStringConverter()  List<String>? tags)?  $default,) {final _that = this;
switch (_that) {
case _Bookmark() when $default != null:
return $default(_that.chapterId,_that.verseId,_that.verseNo,_that.juz,_that.page,_that.createdAt,_that.notes,_that.tags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Bookmark implements Bookmark {
   _Bookmark({this.chapterId, this.verseId, this.verseNo, this.juz, this.page, this.createdAt, this.notes, @JsonListStringConverter() final  List<String>? tags}): _tags = tags;
  factory _Bookmark.fromJson(Map<String, dynamic> json) => _$BookmarkFromJson(json);

@override final  int? chapterId;
@override final  int? verseId;
@override final  int? verseNo;
@override final  int? juz;
@override final  int? page;
@override final  int? createdAt;
@override final  String? notes;
 final  List<String>? _tags;
@override@JsonListStringConverter() List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookmarkCopyWith<_Bookmark> get copyWith => __$BookmarkCopyWithImpl<_Bookmark>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$BookmarkToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Bookmark&&(identical(other.chapterId, chapterId) || other.chapterId == chapterId)&&(identical(other.verseId, verseId) || other.verseId == verseId)&&(identical(other.verseNo, verseNo) || other.verseNo == verseNo)&&(identical(other.juz, juz) || other.juz == juz)&&(identical(other.page, page) || other.page == page)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.notes, notes) || other.notes == notes)&&const DeepCollectionEquality().equals(other._tags, _tags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,chapterId,verseId,verseNo,juz,page,createdAt,notes,const DeepCollectionEquality().hash(_tags));

@override
String toString() {
  return 'Bookmark(chapterId: $chapterId, verseId: $verseId, verseNo: $verseNo, juz: $juz, page: $page, createdAt: $createdAt, notes: $notes, tags: $tags)';
}


}

/// @nodoc
abstract mixin class _$BookmarkCopyWith<$Res> implements $BookmarkCopyWith<$Res> {
  factory _$BookmarkCopyWith(_Bookmark value, $Res Function(_Bookmark) _then) = __$BookmarkCopyWithImpl;
@override @useResult
$Res call({
 int? chapterId, int? verseId, int? verseNo, int? juz, int? page, int? createdAt, String? notes,@JsonListStringConverter() List<String>? tags
});




}
/// @nodoc
class __$BookmarkCopyWithImpl<$Res>
    implements _$BookmarkCopyWith<$Res> {
  __$BookmarkCopyWithImpl(this._self, this._then);

  final _Bookmark _self;
  final $Res Function(_Bookmark) _then;

/// Create a copy of Bookmark
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? chapterId = freezed,Object? verseId = freezed,Object? verseNo = freezed,Object? juz = freezed,Object? page = freezed,Object? createdAt = freezed,Object? notes = freezed,Object? tags = freezed,}) {
  return _then(_Bookmark(
chapterId: freezed == chapterId ? _self.chapterId : chapterId // ignore: cast_nullable_to_non_nullable
as int?,verseId: freezed == verseId ? _self.verseId : verseId // ignore: cast_nullable_to_non_nullable
as int?,verseNo: freezed == verseNo ? _self.verseNo : verseNo // ignore: cast_nullable_to_non_nullable
as int?,juz: freezed == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,notes: freezed == notes ? _self.notes : notes // ignore: cast_nullable_to_non_nullable
as String?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,
  ));
}


}

// dart format on
