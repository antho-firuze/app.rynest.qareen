// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'quran_page.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
QuranPage _$QuranPageFromJson(
  Map<String, dynamic> json
) {
    return _Page.fromJson(
      json
    );
}

/// @nodoc
mixin _$QuranPage {

 int get id; int get startChapterId; int get startVerseNo; int get endChapterId; int get endVerseNo; int get hizbQuarter;
/// Create a copy of QuranPage
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$QuranPageCopyWith<QuranPage> get copyWith => _$QuranPageCopyWithImpl<QuranPage>(this as QuranPage, _$identity);

  /// Serializes this QuranPage to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is QuranPage&&(identical(other.id, id) || other.id == id)&&(identical(other.startChapterId, startChapterId) || other.startChapterId == startChapterId)&&(identical(other.startVerseNo, startVerseNo) || other.startVerseNo == startVerseNo)&&(identical(other.endChapterId, endChapterId) || other.endChapterId == endChapterId)&&(identical(other.endVerseNo, endVerseNo) || other.endVerseNo == endVerseNo)&&(identical(other.hizbQuarter, hizbQuarter) || other.hizbQuarter == hizbQuarter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startChapterId,startVerseNo,endChapterId,endVerseNo,hizbQuarter);

@override
String toString() {
  return 'QuranPage(id: $id, startChapterId: $startChapterId, startVerseNo: $startVerseNo, endChapterId: $endChapterId, endVerseNo: $endVerseNo, hizbQuarter: $hizbQuarter)';
}


}

/// @nodoc
abstract mixin class $QuranPageCopyWith<$Res>  {
  factory $QuranPageCopyWith(QuranPage value, $Res Function(QuranPage) _then) = _$QuranPageCopyWithImpl;
@useResult
$Res call({
 int id, int startChapterId, int startVerseNo, int endChapterId, int endVerseNo, int hizbQuarter
});




}
/// @nodoc
class _$QuranPageCopyWithImpl<$Res>
    implements $QuranPageCopyWith<$Res> {
  _$QuranPageCopyWithImpl(this._self, this._then);

  final QuranPage _self;
  final $Res Function(QuranPage) _then;

/// Create a copy of QuranPage
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? startChapterId = null,Object? startVerseNo = null,Object? endChapterId = null,Object? endVerseNo = null,Object? hizbQuarter = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startChapterId: null == startChapterId ? _self.startChapterId : startChapterId // ignore: cast_nullable_to_non_nullable
as int,startVerseNo: null == startVerseNo ? _self.startVerseNo : startVerseNo // ignore: cast_nullable_to_non_nullable
as int,endChapterId: null == endChapterId ? _self.endChapterId : endChapterId // ignore: cast_nullable_to_non_nullable
as int,endVerseNo: null == endVerseNo ? _self.endVerseNo : endVerseNo // ignore: cast_nullable_to_non_nullable
as int,hizbQuarter: null == hizbQuarter ? _self.hizbQuarter : hizbQuarter // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [QuranPage].
extension QuranPagePatterns on QuranPage {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Page value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Page() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Page value)  $default,){
final _that = this;
switch (_that) {
case _Page():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Page value)?  $default,){
final _that = this;
switch (_that) {
case _Page() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id,  int startChapterId,  int startVerseNo,  int endChapterId,  int endVerseNo,  int hizbQuarter)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.id,_that.startChapterId,_that.startVerseNo,_that.endChapterId,_that.endVerseNo,_that.hizbQuarter);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id,  int startChapterId,  int startVerseNo,  int endChapterId,  int endVerseNo,  int hizbQuarter)  $default,) {final _that = this;
switch (_that) {
case _Page():
return $default(_that.id,_that.startChapterId,_that.startVerseNo,_that.endChapterId,_that.endVerseNo,_that.hizbQuarter);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id,  int startChapterId,  int startVerseNo,  int endChapterId,  int endVerseNo,  int hizbQuarter)?  $default,) {final _that = this;
switch (_that) {
case _Page() when $default != null:
return $default(_that.id,_that.startChapterId,_that.startVerseNo,_that.endChapterId,_that.endVerseNo,_that.hizbQuarter);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Page implements QuranPage {
   _Page({this.id = 1, this.startChapterId = 1, this.startVerseNo = 1, this.endChapterId = 1, this.endVerseNo = 1, this.hizbQuarter = 1});
  factory _Page.fromJson(Map<String, dynamic> json) => _$PageFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey() final  int startChapterId;
@override@JsonKey() final  int startVerseNo;
@override@JsonKey() final  int endChapterId;
@override@JsonKey() final  int endVerseNo;
@override@JsonKey() final  int hizbQuarter;

/// Create a copy of QuranPage
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PageCopyWith<_Page> get copyWith => __$PageCopyWithImpl<_Page>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PageToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Page&&(identical(other.id, id) || other.id == id)&&(identical(other.startChapterId, startChapterId) || other.startChapterId == startChapterId)&&(identical(other.startVerseNo, startVerseNo) || other.startVerseNo == startVerseNo)&&(identical(other.endChapterId, endChapterId) || other.endChapterId == endChapterId)&&(identical(other.endVerseNo, endVerseNo) || other.endVerseNo == endVerseNo)&&(identical(other.hizbQuarter, hizbQuarter) || other.hizbQuarter == hizbQuarter));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,startChapterId,startVerseNo,endChapterId,endVerseNo,hizbQuarter);

@override
String toString() {
  return 'QuranPage(id: $id, startChapterId: $startChapterId, startVerseNo: $startVerseNo, endChapterId: $endChapterId, endVerseNo: $endVerseNo, hizbQuarter: $hizbQuarter)';
}


}

/// @nodoc
abstract mixin class _$PageCopyWith<$Res> implements $QuranPageCopyWith<$Res> {
  factory _$PageCopyWith(_Page value, $Res Function(_Page) _then) = __$PageCopyWithImpl;
@override @useResult
$Res call({
 int id, int startChapterId, int startVerseNo, int endChapterId, int endVerseNo, int hizbQuarter
});




}
/// @nodoc
class __$PageCopyWithImpl<$Res>
    implements _$PageCopyWith<$Res> {
  __$PageCopyWithImpl(this._self, this._then);

  final _Page _self;
  final $Res Function(_Page) _then;

/// Create a copy of QuranPage
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? startChapterId = null,Object? startVerseNo = null,Object? endChapterId = null,Object? endVerseNo = null,Object? hizbQuarter = null,}) {
  return _then(_Page(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,startChapterId: null == startChapterId ? _self.startChapterId : startChapterId // ignore: cast_nullable_to_non_nullable
as int,startVerseNo: null == startVerseNo ? _self.startVerseNo : startVerseNo // ignore: cast_nullable_to_non_nullable
as int,endChapterId: null == endChapterId ? _self.endChapterId : endChapterId // ignore: cast_nullable_to_non_nullable
as int,endVerseNo: null == endVerseNo ? _self.endVerseNo : endVerseNo // ignore: cast_nullable_to_non_nullable
as int,hizbQuarter: null == hizbQuarter ? _self.hizbQuarter : hizbQuarter // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
