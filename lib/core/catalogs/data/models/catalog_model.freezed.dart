// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'catalog_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CatalogModel {

@JsonKey(name: 'table') String get table;@JsonKey(name: 'code') String get code;@JsonKey(name: 'description_en') String get descriptionEn;@JsonKey(name: 'description_es') String get descriptionEs;
/// Create a copy of CatalogModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CatalogModelCopyWith<CatalogModel> get copyWith => _$CatalogModelCopyWithImpl<CatalogModel>(this as CatalogModel, _$identity);

  /// Serializes this CatalogModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CatalogModel&&(identical(other.table, table) || other.table == table)&&(identical(other.code, code) || other.code == code)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionEs, descriptionEs) || other.descriptionEs == descriptionEs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,table,code,descriptionEn,descriptionEs);

@override
String toString() {
  return 'CatalogModel(table: $table, code: $code, descriptionEn: $descriptionEn, descriptionEs: $descriptionEs)';
}


}

/// @nodoc
abstract mixin class $CatalogModelCopyWith<$Res>  {
  factory $CatalogModelCopyWith(CatalogModel value, $Res Function(CatalogModel) _then) = _$CatalogModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'table') String table,@JsonKey(name: 'code') String code,@JsonKey(name: 'description_en') String descriptionEn,@JsonKey(name: 'description_es') String descriptionEs
});




}
/// @nodoc
class _$CatalogModelCopyWithImpl<$Res>
    implements $CatalogModelCopyWith<$Res> {
  _$CatalogModelCopyWithImpl(this._self, this._then);

  final CatalogModel _self;
  final $Res Function(CatalogModel) _then;

/// Create a copy of CatalogModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? table = null,Object? code = null,Object? descriptionEn = null,Object? descriptionEs = null,}) {
  return _then(_self.copyWith(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CatalogModel].
extension CatalogModelPatterns on CatalogModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CatalogModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CatalogModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CatalogModel value)  $default,){
final _that = this;
switch (_that) {
case _CatalogModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CatalogModel value)?  $default,){
final _that = this;
switch (_that) {
case _CatalogModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'table')  String table, @JsonKey(name: 'code')  String code, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CatalogModel() when $default != null:
return $default(_that.table,_that.code,_that.descriptionEn,_that.descriptionEs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'table')  String table, @JsonKey(name: 'code')  String code, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs)  $default,) {final _that = this;
switch (_that) {
case _CatalogModel():
return $default(_that.table,_that.code,_that.descriptionEn,_that.descriptionEs);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'table')  String table, @JsonKey(name: 'code')  String code, @JsonKey(name: 'description_en')  String descriptionEn, @JsonKey(name: 'description_es')  String descriptionEs)?  $default,) {final _that = this;
switch (_that) {
case _CatalogModel() when $default != null:
return $default(_that.table,_that.code,_that.descriptionEn,_that.descriptionEs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CatalogModel implements CatalogModel {
   _CatalogModel({@JsonKey(name: 'table') required this.table, @JsonKey(name: 'code') required this.code, @JsonKey(name: 'description_en') required this.descriptionEn, @JsonKey(name: 'description_es') required this.descriptionEs});
  factory _CatalogModel.fromJson(Map<String, dynamic> json) => _$CatalogModelFromJson(json);

@override@JsonKey(name: 'table') final  String table;
@override@JsonKey(name: 'code') final  String code;
@override@JsonKey(name: 'description_en') final  String descriptionEn;
@override@JsonKey(name: 'description_es') final  String descriptionEs;

/// Create a copy of CatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CatalogModelCopyWith<_CatalogModel> get copyWith => __$CatalogModelCopyWithImpl<_CatalogModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CatalogModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CatalogModel&&(identical(other.table, table) || other.table == table)&&(identical(other.code, code) || other.code == code)&&(identical(other.descriptionEn, descriptionEn) || other.descriptionEn == descriptionEn)&&(identical(other.descriptionEs, descriptionEs) || other.descriptionEs == descriptionEs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,table,code,descriptionEn,descriptionEs);

@override
String toString() {
  return 'CatalogModel(table: $table, code: $code, descriptionEn: $descriptionEn, descriptionEs: $descriptionEs)';
}


}

/// @nodoc
abstract mixin class _$CatalogModelCopyWith<$Res> implements $CatalogModelCopyWith<$Res> {
  factory _$CatalogModelCopyWith(_CatalogModel value, $Res Function(_CatalogModel) _then) = __$CatalogModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'table') String table,@JsonKey(name: 'code') String code,@JsonKey(name: 'description_en') String descriptionEn,@JsonKey(name: 'description_es') String descriptionEs
});




}
/// @nodoc
class __$CatalogModelCopyWithImpl<$Res>
    implements _$CatalogModelCopyWith<$Res> {
  __$CatalogModelCopyWithImpl(this._self, this._then);

  final _CatalogModel _self;
  final $Res Function(_CatalogModel) _then;

/// Create a copy of CatalogModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? table = null,Object? code = null,Object? descriptionEn = null,Object? descriptionEs = null,}) {
  return _then(_CatalogModel(
table: null == table ? _self.table : table // ignore: cast_nullable_to_non_nullable
as String,code: null == code ? _self.code : code // ignore: cast_nullable_to_non_nullable
as String,descriptionEn: null == descriptionEn ? _self.descriptionEn : descriptionEn // ignore: cast_nullable_to_non_nullable
as String,descriptionEs: null == descriptionEs ? _self.descriptionEs : descriptionEs // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
