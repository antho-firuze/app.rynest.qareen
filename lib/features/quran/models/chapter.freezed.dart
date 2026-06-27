// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Chapter {

 int get id;@JsonKey(name: 'nameSimple') String get name;@JsonKey(name: 'verseCount') int get versesCount;@JsonKey(name: 'bismillah')@JsonBoolConverter() bool get bismillahPre;@JsonKey(name: 'revelationPlace') String get revelationPlace;@JsonKey(name: 'revelationOrder') int get revelationOrder;@JsonKey(name: 'translated') String get translatedName;
/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ChapterCopyWith<Chapter> get copyWith => _$ChapterCopyWithImpl<Chapter>(this as Chapter, _$identity);

  /// Serializes this Chapter to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.versesCount, versesCount) || other.versesCount == versesCount)&&(identical(other.bismillahPre, bismillahPre) || other.bismillahPre == bismillahPre)&&(identical(other.revelationPlace, revelationPlace) || other.revelationPlace == revelationPlace)&&(identical(other.revelationOrder, revelationOrder) || other.revelationOrder == revelationOrder)&&(identical(other.translatedName, translatedName) || other.translatedName == translatedName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,versesCount,bismillahPre,revelationPlace,revelationOrder,translatedName);

@override
String toString() {
  return 'Chapter(id: $id, name: $name, versesCount: $versesCount, bismillahPre: $bismillahPre, revelationPlace: $revelationPlace, revelationOrder: $revelationOrder, translatedName: $translatedName)';
}


}

/// @nodoc
abstract mixin class $ChapterCopyWith<$Res>  {
  factory $ChapterCopyWith(Chapter value, $Res Function(Chapter) _then) = _$ChapterCopyWithImpl;
@useResult
$Res call({
 int id,@JsonKey(name: 'nameSimple') String name,@JsonKey(name: 'verseCount') int versesCount,@JsonKey(name: 'bismillah')@JsonBoolConverter() bool bismillahPre,@JsonKey(name: 'revelationPlace') String revelationPlace,@JsonKey(name: 'revelationOrder') int revelationOrder,@JsonKey(name: 'translated') String translatedName
});




}
/// @nodoc
class _$ChapterCopyWithImpl<$Res>
    implements $ChapterCopyWith<$Res> {
  _$ChapterCopyWithImpl(this._self, this._then);

  final Chapter _self;
  final $Res Function(Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? versesCount = null,Object? bismillahPre = null,Object? revelationPlace = null,Object? revelationOrder = null,Object? translatedName = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versesCount: null == versesCount ? _self.versesCount : versesCount // ignore: cast_nullable_to_non_nullable
as int,bismillahPre: null == bismillahPre ? _self.bismillahPre : bismillahPre // ignore: cast_nullable_to_non_nullable
as bool,revelationPlace: null == revelationPlace ? _self.revelationPlace : revelationPlace // ignore: cast_nullable_to_non_nullable
as String,revelationOrder: null == revelationOrder ? _self.revelationOrder : revelationOrder // ignore: cast_nullable_to_non_nullable
as int,translatedName: null == translatedName ? _self.translatedName : translatedName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [Chapter].
extension ChapterPatterns on Chapter {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Chapter value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Chapter value)  $default,){
final _that = this;
switch (_that) {
case _Chapter():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Chapter value)?  $default,){
final _that = this;
switch (_that) {
case _Chapter() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'nameSimple')  String name, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'bismillah')@JsonBoolConverter()  bool bismillahPre, @JsonKey(name: 'revelationPlace')  String revelationPlace, @JsonKey(name: 'revelationOrder')  int revelationOrder, @JsonKey(name: 'translated')  String translatedName)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.name,_that.versesCount,_that.bismillahPre,_that.revelationPlace,_that.revelationOrder,_that.translatedName);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int id, @JsonKey(name: 'nameSimple')  String name, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'bismillah')@JsonBoolConverter()  bool bismillahPre, @JsonKey(name: 'revelationPlace')  String revelationPlace, @JsonKey(name: 'revelationOrder')  int revelationOrder, @JsonKey(name: 'translated')  String translatedName)  $default,) {final _that = this;
switch (_that) {
case _Chapter():
return $default(_that.id,_that.name,_that.versesCount,_that.bismillahPre,_that.revelationPlace,_that.revelationOrder,_that.translatedName);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int id, @JsonKey(name: 'nameSimple')  String name, @JsonKey(name: 'verseCount')  int versesCount, @JsonKey(name: 'bismillah')@JsonBoolConverter()  bool bismillahPre, @JsonKey(name: 'revelationPlace')  String revelationPlace, @JsonKey(name: 'revelationOrder')  int revelationOrder, @JsonKey(name: 'translated')  String translatedName)?  $default,) {final _that = this;
switch (_that) {
case _Chapter() when $default != null:
return $default(_that.id,_that.name,_that.versesCount,_that.bismillahPre,_that.revelationPlace,_that.revelationOrder,_that.translatedName);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Chapter implements Chapter {
   _Chapter({this.id = 0, @JsonKey(name: 'nameSimple') this.name = '', @JsonKey(name: 'verseCount') this.versesCount = 0, @JsonKey(name: 'bismillah')@JsonBoolConverter() this.bismillahPre = true, @JsonKey(name: 'revelationPlace') this.revelationPlace = '', @JsonKey(name: 'revelationOrder') this.revelationOrder = 0, @JsonKey(name: 'translated') this.translatedName = ''});
  factory _Chapter.fromJson(Map<String, dynamic> json) => _$ChapterFromJson(json);

@override@JsonKey() final  int id;
@override@JsonKey(name: 'nameSimple') final  String name;
@override@JsonKey(name: 'verseCount') final  int versesCount;
@override@JsonKey(name: 'bismillah')@JsonBoolConverter() final  bool bismillahPre;
@override@JsonKey(name: 'revelationPlace') final  String revelationPlace;
@override@JsonKey(name: 'revelationOrder') final  int revelationOrder;
@override@JsonKey(name: 'translated') final  String translatedName;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ChapterCopyWith<_Chapter> get copyWith => __$ChapterCopyWithImpl<_Chapter>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ChapterToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Chapter&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.versesCount, versesCount) || other.versesCount == versesCount)&&(identical(other.bismillahPre, bismillahPre) || other.bismillahPre == bismillahPre)&&(identical(other.revelationPlace, revelationPlace) || other.revelationPlace == revelationPlace)&&(identical(other.revelationOrder, revelationOrder) || other.revelationOrder == revelationOrder)&&(identical(other.translatedName, translatedName) || other.translatedName == translatedName));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,versesCount,bismillahPre,revelationPlace,revelationOrder,translatedName);

@override
String toString() {
  return 'Chapter(id: $id, name: $name, versesCount: $versesCount, bismillahPre: $bismillahPre, revelationPlace: $revelationPlace, revelationOrder: $revelationOrder, translatedName: $translatedName)';
}


}

/// @nodoc
abstract mixin class _$ChapterCopyWith<$Res> implements $ChapterCopyWith<$Res> {
  factory _$ChapterCopyWith(_Chapter value, $Res Function(_Chapter) _then) = __$ChapterCopyWithImpl;
@override @useResult
$Res call({
 int id,@JsonKey(name: 'nameSimple') String name,@JsonKey(name: 'verseCount') int versesCount,@JsonKey(name: 'bismillah')@JsonBoolConverter() bool bismillahPre,@JsonKey(name: 'revelationPlace') String revelationPlace,@JsonKey(name: 'revelationOrder') int revelationOrder,@JsonKey(name: 'translated') String translatedName
});




}
/// @nodoc
class __$ChapterCopyWithImpl<$Res>
    implements _$ChapterCopyWith<$Res> {
  __$ChapterCopyWithImpl(this._self, this._then);

  final _Chapter _self;
  final $Res Function(_Chapter) _then;

/// Create a copy of Chapter
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? versesCount = null,Object? bismillahPre = null,Object? revelationPlace = null,Object? revelationOrder = null,Object? translatedName = null,}) {
  return _then(_Chapter(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as int,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,versesCount: null == versesCount ? _self.versesCount : versesCount // ignore: cast_nullable_to_non_nullable
as int,bismillahPre: null == bismillahPre ? _self.bismillahPre : bismillahPre // ignore: cast_nullable_to_non_nullable
as bool,revelationPlace: null == revelationPlace ? _self.revelationPlace : revelationPlace // ignore: cast_nullable_to_non_nullable
as String,revelationOrder: null == revelationOrder ? _self.revelationOrder : revelationOrder // ignore: cast_nullable_to_non_nullable
as int,translatedName: null == translatedName ? _self.translatedName : translatedName // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
