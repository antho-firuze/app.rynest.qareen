// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'juz.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Juz {

 int get id;@JsonKey(name: 'firstVerseId') int get firstVerseId;@JsonKey(name: 'lastVerseId') int get lastVerseId;@JsonKey(name: 'verseCount') int get versesCount;@JsonKey(name: 'startChapterId') int get startChapterId;@JsonKey(name: 'startVerseNo') int get startVerseNo;
/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$JuzCopyWith<Juz> get copyWith => _$JuzCopyWithImpl<Juz>(this as Juz, _$identity);

  /// Serializes this Juz to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Juz&&(identical(other.id, id) || other.id == id)&&(identical(other.firstVerseId, firstVerseId) || other.firstVerseId == firstVerseId)&&(identical(other.lastVerseId, lastVerseId) || other.lastVerseId == lastVerseId)&&(identical(other.versesCount, versesCount) || other.versesCount == versesCount)&&(identical(other.startChapterId, startChapterId) || other.startChapterId == startChapterId)&&(identical(other.startVerseNo, startVerseNo) || other.startVerseNo == startVerseNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstVerseId,lastVerseId,versesCount,startChapterId,startVerseNo);

@override
String toString() {
  return 'Juz(id: $id, firstVerseId: $firstVerseId, lastVerseId: $lastVerseId, versesCount: $versesCount, startChapterId: $startChapterId, startVerseNo: $startVerseNo)';
}


}

/// @nodoc
abstract mixin class $JuzCopyWith<$Res>  {
  factory $JuzCopyWith(Juz value, $Res Function(Juz) _then) = _$JuzCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'firstVerseId') int firstVerseId,@JsonKey(name: 'lastVerseId') int lastVerseId,@JsonKey(name: 'verseCount') int versesCount,@JsonKey(name: 'startChapterId') int startChapterId,@JsonKey(name: 'startVerseNo') int startVerseNo
});




}
/// @nodoc
class _$JuzCopyWithImpl<$Res>
    implements $JuzCopyWith<$Res> {
  _$JuzCopyWithImpl(this._self, this._then);

  final Juz _self;
  final $Res Function(Juz) _then;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? firstVerseId = null,Object? lastVerseId = null,Object? versesCount = null,Object? startChapterId = null,Object? startVerseNo = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstVerseId: null == firstVerseId ? _self.firstVerseId : firstVerseId // ignore: cast_nullable_to_non_nullable
as int,lastVerseId: null == lastVerseId ? _self.lastVerseId : lastVerseId // ignore: cast_nullable_to_non_nullable
as int,versesCount: null == versesCount ? _self.versesCount : versesCount // ignore: cast_nullable_to_non_nullable
as int,startChapterId: null == startChapterId ? _self.startChapterId : startChapterId // ignore: cast_nullable_to_non_nullable
as int,startVerseNo: null == startVerseNo ? _self.startVerseNo : startVerseNo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [Juz].
extension JuzPatterns on Juz {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Juz value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Juz() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Juz value)  $default,){
final _that = this;
switch (_that) {
case _Juz():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Juz value)?  $default,){
final _that = this;
switch (_that) {
case _Juz() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'firstVerseId')  int firstVerseId, @JsonKey(name: 'lastVerseId')  int lastVerseId, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'startChapterId')  int startChapterId, @JsonKey(name: 'startVerseNo')  int startVerseNo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that.id,_that.firstVerseId,_that.lastVerseId,_that.versesCount,_that.startChapterId,_that.startVerseNo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'firstVerseId')  int firstVerseId, @JsonKey(name: 'lastVerseId')  int lastVerseId, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'startChapterId')  int startChapterId, @JsonKey(name: 'startVerseNo')  int startVerseNo)  $default,) {final _that = this;
switch (_that) {
case _Juz():
return $default(_that.id,_that.firstVerseId,_that.lastVerseId,_that.versesCount,_that.startChapterId,_that.startVerseNo);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'firstVerseId')  int firstVerseId, @JsonKey(name: 'lastVerseId')  int lastVerseId, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'startChapterId')  int startChapterId, @JsonKey(name: 'startVerseNo')  int startVerseNo)?  $default,) {final _that = this;
switch (_that) {
case _Juz() when $default != null:
return $default(_that.id,_that.firstVerseId,_that.lastVerseId,_that.versesCount,_that.startChapterId,_that.startVerseNo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Juz implements Juz {
   _Juz({this.id = 0, @JsonKey(name: 'firstVerseId') this.firstVerseId = 0, @JsonKey(name: 'lastVerseId') this.lastVerseId = 0, @JsonKey(name: 'verseCount') this.versesCount = 0, @JsonKey(name: 'startChapterId') this.startChapterId = 0, @JsonKey(name: 'startVerseNo') this.startVerseNo = 0});
  factory _Juz.fromJson(Map<String, dynamic> json) => _$JuzFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'firstVerseId') final  int firstVerseId;
@override@JsonKey(name: 'lastVerseId') final  int lastVerseId;
@override@JsonKey(name: 'verseCount') final  int versesCount;
@override@JsonKey(name: 'startChapterId') final  int startChapterId;
@override@JsonKey(name: 'startVerseNo') final  int startVerseNo;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$JuzCopyWith<_Juz> get copyWith => __$JuzCopyWithImpl<_Juz>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$JuzToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Juz&&(identical(other.id, id) || other.id == id)&&(identical(other.firstVerseId, firstVerseId) || other.firstVerseId == firstVerseId)&&(identical(other.lastVerseId, lastVerseId) || other.lastVerseId == lastVerseId)&&(identical(other.versesCount, versesCount) || other.versesCount == versesCount)&&(identical(other.startChapterId, startChapterId) || other.startChapterId == startChapterId)&&(identical(other.startVerseNo, startVerseNo) || other.startVerseNo == startVerseNo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,firstVerseId,lastVerseId,versesCount,startChapterId,startVerseNo);

@override
String toString() {
  return 'Juz(id: $id, firstVerseId: $firstVerseId, lastVerseId: $lastVerseId, versesCount: $versesCount, startChapterId: $startChapterId, startVerseNo: $startVerseNo)';
}


}

/// @nodoc
abstract mixin class _$JuzCopyWith<$Res> implements $JuzCopyWith<$Res> {
  factory _$JuzCopyWith(_Juz value, $Res Function(_Juz) _then) = __$JuzCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'firstVerseId') int firstVerseId,@JsonKey(name: 'lastVerseId') int lastVerseId,@JsonKey(name: 'verseCount') int versesCount,@JsonKey(name: 'startChapterId') int startChapterId,@JsonKey(name: 'startVerseNo') int startVerseNo
});




}
/// @nodoc
class __$JuzCopyWithImpl<$Res>
    implements _$JuzCopyWith<$Res> {
  __$JuzCopyWithImpl(this._self, this._then);

  final _Juz _self;
  final $Res Function(_Juz) _then;

/// Create a copy of Juz
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? firstVerseId = null,Object? lastVerseId = null,Object? versesCount = null,Object? startChapterId = null,Object? startVerseNo = null,}) {
  return _then(_Juz(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,firstVerseId: null == firstVerseId ? _self.firstVerseId : firstVerseId // ignore: cast_nullable_to_non_nullable
as int,lastVerseId: null == lastVerseId ? _self.lastVerseId : lastVerseId // ignore: cast_nullable_to_non_nullable
as int,versesCount: null == versesCount ? _self.versesCount : versesCount // ignore: cast_nullable_to_non_nullable
as int,startChapterId: null == startChapterId ? _self.startChapterId : startChapterId // ignore: cast_nullable_to_non_nullable
as int,startVerseNo: null == startVerseNo ? _self.startVerseNo : startVerseNo // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
