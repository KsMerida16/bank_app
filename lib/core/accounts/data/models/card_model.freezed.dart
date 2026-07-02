// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'card_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CardModel {

@JsonKey(name: 'user_id') String get cardUserId;@JsonKey(name: 'card_number') String get cardNumber;@JsonKey(name: 'card_name') String get cardHolderName;@JsonKey(name: 'card_expiration') String get expirationDate;@JsonKey(name: 'card_cvv') String get cvv;
/// Create a copy of CardModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CardModelCopyWith<CardModel> get copyWith => _$CardModelCopyWithImpl<CardModel>(this as CardModel, _$identity);

  /// Serializes this CardModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CardModel&&(identical(other.cardUserId, cardUserId) || other.cardUserId == cardUserId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.cvv, cvv) || other.cvv == cvv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardUserId,cardNumber,cardHolderName,expirationDate,cvv);

@override
String toString() {
  return 'CardModel(cardUserId: $cardUserId, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationDate: $expirationDate, cvv: $cvv)';
}


}

/// @nodoc
abstract mixin class $CardModelCopyWith<$Res>  {
  factory $CardModelCopyWith(CardModel value, $Res Function(CardModel) _then) = _$CardModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String cardUserId,@JsonKey(name: 'card_number') String cardNumber,@JsonKey(name: 'card_name') String cardHolderName,@JsonKey(name: 'card_expiration') String expirationDate,@JsonKey(name: 'card_cvv') String cvv
});




}
/// @nodoc
class _$CardModelCopyWithImpl<$Res>
    implements $CardModelCopyWith<$Res> {
  _$CardModelCopyWithImpl(this._self, this._then);

  final CardModel _self;
  final $Res Function(CardModel) _then;

/// Create a copy of CardModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardUserId = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expirationDate = null,Object? cvv = null,}) {
  return _then(_self.copyWith(
cardUserId: null == cardUserId ? _self.cardUserId : cardUserId // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [CardModel].
extension CardModelPatterns on CardModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CardModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CardModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CardModel value)  $default,){
final _that = this;
switch (_that) {
case _CardModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CardModel value)?  $default,){
final _that = this;
switch (_that) {
case _CardModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String cardUserId, @JsonKey(name: 'card_number')  String cardNumber, @JsonKey(name: 'card_name')  String cardHolderName, @JsonKey(name: 'card_expiration')  String expirationDate, @JsonKey(name: 'card_cvv')  String cvv)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CardModel() when $default != null:
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate,_that.cvv);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String cardUserId, @JsonKey(name: 'card_number')  String cardNumber, @JsonKey(name: 'card_name')  String cardHolderName, @JsonKey(name: 'card_expiration')  String expirationDate, @JsonKey(name: 'card_cvv')  String cvv)  $default,) {final _that = this;
switch (_that) {
case _CardModel():
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate,_that.cvv);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String cardUserId, @JsonKey(name: 'card_number')  String cardNumber, @JsonKey(name: 'card_name')  String cardHolderName, @JsonKey(name: 'card_expiration')  String expirationDate, @JsonKey(name: 'card_cvv')  String cvv)?  $default,) {final _that = this;
switch (_that) {
case _CardModel() when $default != null:
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate,_that.cvv);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CardModel implements CardModel {
   _CardModel({@JsonKey(name: 'user_id') required this.cardUserId, @JsonKey(name: 'card_number') required this.cardNumber, @JsonKey(name: 'card_name') required this.cardHolderName, @JsonKey(name: 'card_expiration') required this.expirationDate, @JsonKey(name: 'card_cvv') required this.cvv});
  factory _CardModel.fromJson(Map<String, dynamic> json) => _$CardModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String cardUserId;
@override@JsonKey(name: 'card_number') final  String cardNumber;
@override@JsonKey(name: 'card_name') final  String cardHolderName;
@override@JsonKey(name: 'card_expiration') final  String expirationDate;
@override@JsonKey(name: 'card_cvv') final  String cvv;

/// Create a copy of CardModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CardModelCopyWith<_CardModel> get copyWith => __$CardModelCopyWithImpl<_CardModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CardModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CardModel&&(identical(other.cardUserId, cardUserId) || other.cardUserId == cardUserId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate)&&(identical(other.cvv, cvv) || other.cvv == cvv));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,cardUserId,cardNumber,cardHolderName,expirationDate,cvv);

@override
String toString() {
  return 'CardModel(cardUserId: $cardUserId, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationDate: $expirationDate, cvv: $cvv)';
}


}

/// @nodoc
abstract mixin class _$CardModelCopyWith<$Res> implements $CardModelCopyWith<$Res> {
  factory _$CardModelCopyWith(_CardModel value, $Res Function(_CardModel) _then) = __$CardModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String cardUserId,@JsonKey(name: 'card_number') String cardNumber,@JsonKey(name: 'card_name') String cardHolderName,@JsonKey(name: 'card_expiration') String expirationDate,@JsonKey(name: 'card_cvv') String cvv
});




}
/// @nodoc
class __$CardModelCopyWithImpl<$Res>
    implements _$CardModelCopyWith<$Res> {
  __$CardModelCopyWithImpl(this._self, this._then);

  final _CardModel _self;
  final $Res Function(_CardModel) _then;

/// Create a copy of CardModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardUserId = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expirationDate = null,Object? cvv = null,}) {
  return _then(_CardModel(
cardUserId: null == cardUserId ? _self.cardUserId : cardUserId // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String,cvv: null == cvv ? _self.cvv : cvv // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
