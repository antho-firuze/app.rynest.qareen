// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'verse.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Verse {

 int get id;@JsonKey(name: 'chapterId') int get chapter;@JsonKey(name: 'verseNo') int get number;@JsonKey(name: 'juz') int get juz;@JsonKey(name: 'page') int get page;@JsonKey(name: 'arabic') String get ar;@JsonKey(name: 'latin') String get tr;@JsonKey(name: 'indo') String get idn;
/// Create a copy of Verse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$VerseCopyWith<Verse> get copyWith => _$VerseCopyWithImpl<Verse>(this as Verse, _$identity);

  /// Serializes this Verse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Verse&&(identical(other.id, id) || other.id == id)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.number, number) || other.number == number)&&(identical(other.juz, juz) || other.juz == juz)&&(identical(other.page, page) || other.page == page)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.tr, tr) || other.tr == tr)&&(identical(other.idn, idn) || other.idn == idn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapter,number,juz,page,ar,tr,idn);

@override
String toString() {
  return 'Verse(id: $id, chapter: $chapter, number: $number, juz: $juz, page: $page, ar: $ar, tr: $tr, idn: $idn)';
}


}

/// @nodoc
abstract mixin class $VerseCopyWith<$Res>  {
  factory $VerseCopyWith(Verse value, $Res Function(Verse) _then) = _$VerseCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'chapterId') int chapter,@JsonKey(name: 'verseNo') int number,@JsonKey(name: 'juz') int juz,@JsonKey(name: 'page') int page,@JsonKey(name: 'arabic') String ar,@JsonKey(name: 'latin') String tr,@JsonKey(name: 'indo') String idn
});




}
/// @nodoc
class _$VerseCopyWithImpl<$Res>
    implements $VerseCopyWith<$Res> {
  _$VerseCopyWithImpl(this._self, this._then);

  final Verse _self;
  final $Res Function(Verse) _then;

/// Create a copy of Verse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? chapter = null,Object? number = null,Object? juz = null,Object? page = null,Object? ar = null,Object? tr = null,Object? idn = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,juz: null == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,tr: null == tr ? _self.tr : tr // ignore: cast_nullable_to_non_nullable
as String,idn: null == idn ? _self.idn : idn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Verse].
extension VersePatterns on Verse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Verse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Verse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Verse value)  $default,){
final _that = this;
switch (_that) {
case _Verse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Verse value)?  $default,){
final _that = this;
switch (_that) {
case _Verse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chapterId')  int chapter, @JsonKey(name: 'verseNo')  int number, @JsonKey(name: 'juz')  int juz, @JsonKey(name: 'page')  int page, @JsonKey(name: 'arabic')  String ar, @JsonKey(name: 'latin')  String tr, @JsonKey(name: 'indo')  String idn)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Verse() when $default != null:
return $default(_that.id,_that.chapter,_that.number,_that.juz,_that.page,_that.ar,_that.tr,_that.idn);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'chapterId')  int chapter, @JsonKey(name: 'verseNo')  int number, @JsonKey(name: 'juz')  int juz, @JsonKey(name: 'page')  int page, @JsonKey(name: 'arabic')  String ar, @JsonKey(name: 'latin')  String tr, @JsonKey(name: 'indo')  String idn)  $default,) {final _that = this;
switch (_that) {
case _Verse():
return $default(_that.id,_that.chapter,_that.number,_that.juz,_that.page,_that.ar,_that.tr,_that.idn);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'chapterId')  int chapter, @JsonKey(name: 'verseNo')  int number, @JsonKey(name: 'juz')  int juz, @JsonKey(name: 'page')  int page, @JsonKey(name: 'arabic')  String ar, @JsonKey(name: 'latin')  String tr, @JsonKey(name: 'indo')  String idn)?  $default,) {final _that = this;
switch (_that) {
case _Verse() when $default != null:
return $default(_that.id,_that.chapter,_that.number,_that.juz,_that.page,_that.ar,_that.tr,_that.idn);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Verse implements Verse {
   _Verse({this.id = 0, @JsonKey(name: 'chapterId') this.chapter = 0, @JsonKey(name: 'verseNo') this.number = 0, @JsonKey(name: 'juz') this.juz = 0, @JsonKey(name: 'page') this.page = 0, @JsonKey(name: 'arabic') this.ar = '', @JsonKey(name: 'latin') this.tr = '', @JsonKey(name: 'indo') this.idn = ''});
  factory _Verse.fromJson(Map<String, dynamic> json) => _$VerseFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'chapterId') final  int chapter;
@override@JsonKey(name: 'verseNo') final  int number;
@override@JsonKey(name: 'juz') final  int juz;
@override@JsonKey(name: 'page') final  int page;
@override@JsonKey(name: 'arabic') final  String ar;
@override@JsonKey(name: 'latin') final  String tr;
@override@JsonKey(name: 'indo') final  String idn;

/// Create a copy of Verse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$VerseCopyWith<_Verse> get copyWith => __$VerseCopyWithImpl<_Verse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$VerseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Verse&&(identical(other.id, id) || other.id == id)&&(identical(other.chapter, chapter) || other.chapter == chapter)&&(identical(other.number, number) || other.number == number)&&(identical(other.juz, juz) || other.juz == juz)&&(identical(other.page, page) || other.page == page)&&(identical(other.ar, ar) || other.ar == ar)&&(identical(other.tr, tr) || other.tr == tr)&&(identical(other.idn, idn) || other.idn == idn));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,chapter,number,juz,page,ar,tr,idn);

@override
String toString() {
  return 'Verse(id: $id, chapter: $chapter, number: $number, juz: $juz, page: $page, ar: $ar, tr: $tr, idn: $idn)';
}


}

/// @nodoc
abstract mixin class _$VerseCopyWith<$Res> implements $VerseCopyWith<$Res> {
  factory _$VerseCopyWith(_Verse value, $Res Function(_Verse) _then) = __$VerseCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'chapterId') int chapter,@JsonKey(name: 'verseNo') int number,@JsonKey(name: 'juz') int juz,@JsonKey(name: 'page') int page,@JsonKey(name: 'arabic') String ar,@JsonKey(name: 'latin') String tr,@JsonKey(name: 'indo') String idn
});




}
/// @nodoc
class __$VerseCopyWithImpl<$Res>
    implements _$VerseCopyWith<$Res> {
  __$VerseCopyWithImpl(this._self, this._then);

  final _Verse _self;
  final $Res Function(_Verse) _then;

/// Create a copy of Verse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? chapter = null,Object? number = null,Object? juz = null,Object? page = null,Object? ar = null,Object? tr = null,Object? idn = null,}) {
  return _then(_Verse(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,chapter: null == chapter ? _self.chapter : chapter // ignore: cast_nullable_to_non_nullable
as int,number: null == number ? _self.number : number // ignore: cast_nullable_to_non_nullable
as int,juz: null == juz ? _self.juz : juz // ignore: cast_nullable_to_non_nullable
as int,page: null == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int,ar: null == ar ? _self.ar : ar // ignore: cast_nullable_to_non_nullable
as String,tr: null == tr ? _self.tr : tr // ignore: cast_nullable_to_non_nullable
as String,idn: null == idn ? _self.idn : idn // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
