// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'movement_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MovementModel {

@JsonKey(name: 'date') String get date;@JsonKey(name: 'timestamp') String get timestamp;@JsonKey(name: 'description') String get description;@JsonKey(name: 'amount') double get amount;@JsonKey(name: 'type') String get type;@JsonKey(name: 'sign') String get sign;@JsonKey(name: 'category') String get category;
/// Create a copy of MovementModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MovementModelCopyWith<MovementModel> get copyWith => _$MovementModelCopyWithImpl<MovementModel>(this as MovementModel, _$identity);

  /// Serializes this MovementModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MovementModel&&(identical(other.date, date) || other.date == date)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.sign, sign) || other.sign == sign)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timestamp,description,amount,type,sign,category);

@override
String toString() {
  return 'MovementModel(date: $date, timestamp: $timestamp, description: $description, amount: $amount, type: $type, sign: $sign, category: $category)';
}


}

/// @nodoc
abstract mixin class $MovementModelCopyWith<$Res>  {
  factory $MovementModelCopyWith(MovementModel value, $Res Function(MovementModel) _then) = _$MovementModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'date') String date,@JsonKey(name: 'timestamp') String timestamp,@JsonKey(name: 'description') String description,@JsonKey(name: 'amount') double amount,@JsonKey(name: 'type') String type,@JsonKey(name: 'sign') String sign,@JsonKey(name: 'category') String category
});




}
/// @nodoc
class _$MovementModelCopyWithImpl<$Res>
    implements $MovementModelCopyWith<$Res> {
  _$MovementModelCopyWithImpl(this._self, this._then);

  final MovementModel _self;
  final $Res Function(MovementModel) _then;

/// Create a copy of MovementModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? date = null,Object? timestamp = null,Object? description = null,Object? amount = null,Object? type = null,Object? sign = null,Object? category = null,}) {
  return _then(_self.copyWith(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [MovementModel].
extension MovementModelPatterns on MovementModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MovementModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MovementModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MovementModel value)  $default,){
final _that = this;
switch (_that) {
case _MovementModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MovementModel value)?  $default,){
final _that = this;
switch (_that) {
case _MovementModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  String timestamp, @JsonKey(name: 'description')  String description, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'type')  String type, @JsonKey(name: 'sign')  String sign, @JsonKey(name: 'category')  String category)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MovementModel() when $default != null:
return $default(_that.date,_that.timestamp,_that.description,_that.amount,_that.type,_that.sign,_that.category);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  String timestamp, @JsonKey(name: 'description')  String description, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'type')  String type, @JsonKey(name: 'sign')  String sign, @JsonKey(name: 'category')  String category)  $default,) {final _that = this;
switch (_that) {
case _MovementModel():
return $default(_that.date,_that.timestamp,_that.description,_that.amount,_that.type,_that.sign,_that.category);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'date')  String date, @JsonKey(name: 'timestamp')  String timestamp, @JsonKey(name: 'description')  String description, @JsonKey(name: 'amount')  double amount, @JsonKey(name: 'type')  String type, @JsonKey(name: 'sign')  String sign, @JsonKey(name: 'category')  String category)?  $default,) {final _that = this;
switch (_that) {
case _MovementModel() when $default != null:
return $default(_that.date,_that.timestamp,_that.description,_that.amount,_that.type,_that.sign,_that.category);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MovementModel implements MovementModel {
  const _MovementModel({@JsonKey(name: 'date') required this.date, @JsonKey(name: 'timestamp') required this.timestamp, @JsonKey(name: 'description') required this.description, @JsonKey(name: 'amount') required this.amount, @JsonKey(name: 'type') required this.type, @JsonKey(name: 'sign') required this.sign, @JsonKey(name: 'category') required this.category});
  factory _MovementModel.fromJson(Map<String, dynamic> json) => _$MovementModelFromJson(json);

@override@JsonKey(name: 'date') final  String date;
@override@JsonKey(name: 'timestamp') final  String timestamp;
@override@JsonKey(name: 'description') final  String description;
@override@JsonKey(name: 'amount') final  double amount;
@override@JsonKey(name: 'type') final  String type;
@override@JsonKey(name: 'sign') final  String sign;
@override@JsonKey(name: 'category') final  String category;

/// Create a copy of MovementModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MovementModelCopyWith<_MovementModel> get copyWith => __$MovementModelCopyWithImpl<_MovementModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MovementModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MovementModel&&(identical(other.date, date) || other.date == date)&&(identical(other.timestamp, timestamp) || other.timestamp == timestamp)&&(identical(other.description, description) || other.description == description)&&(identical(other.amount, amount) || other.amount == amount)&&(identical(other.type, type) || other.type == type)&&(identical(other.sign, sign) || other.sign == sign)&&(identical(other.category, category) || other.category == category));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,date,timestamp,description,amount,type,sign,category);

@override
String toString() {
  return 'MovementModel(date: $date, timestamp: $timestamp, description: $description, amount: $amount, type: $type, sign: $sign, category: $category)';
}


}

/// @nodoc
abstract mixin class _$MovementModelCopyWith<$Res> implements $MovementModelCopyWith<$Res> {
  factory _$MovementModelCopyWith(_MovementModel value, $Res Function(_MovementModel) _then) = __$MovementModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'date') String date,@JsonKey(name: 'timestamp') String timestamp,@JsonKey(name: 'description') String description,@JsonKey(name: 'amount') double amount,@JsonKey(name: 'type') String type,@JsonKey(name: 'sign') String sign,@JsonKey(name: 'category') String category
});




}
/// @nodoc
class __$MovementModelCopyWithImpl<$Res>
    implements _$MovementModelCopyWith<$Res> {
  __$MovementModelCopyWithImpl(this._self, this._then);

  final _MovementModel _self;
  final $Res Function(_MovementModel) _then;

/// Create a copy of MovementModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? date = null,Object? timestamp = null,Object? description = null,Object? amount = null,Object? type = null,Object? sign = null,Object? category = null,}) {
  return _then(_MovementModel(
date: null == date ? _self.date : date // ignore: cast_nullable_to_non_nullable
as String,timestamp: null == timestamp ? _self.timestamp : timestamp // ignore: cast_nullable_to_non_nullable
as String,description: null == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String,amount: null == amount ? _self.amount : amount // ignore: cast_nullable_to_non_nullable
as double,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,sign: null == sign ? _self.sign : sign // ignore: cast_nullable_to_non_nullable
as String,category: null == category ? _self.category : category // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
