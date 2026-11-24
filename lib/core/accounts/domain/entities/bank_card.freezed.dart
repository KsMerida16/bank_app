// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'bank_card.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BankCard {

 String get cardUserId; String get cardNumber; String get cardHolderName; String get expirationDate;
/// Create a copy of BankCard
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BankCardCopyWith<BankCard> get copyWith => _$BankCardCopyWithImpl<BankCard>(this as BankCard, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BankCard&&(identical(other.cardUserId, cardUserId) || other.cardUserId == cardUserId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,cardUserId,cardNumber,cardHolderName,expirationDate);

@override
String toString() {
  return 'BankCard(cardUserId: $cardUserId, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class $BankCardCopyWith<$Res>  {
  factory $BankCardCopyWith(BankCard value, $Res Function(BankCard) _then) = _$BankCardCopyWithImpl;
@useResult
$Res call({
 String cardUserId, String cardNumber, String cardHolderName, String expirationDate
});




}
/// @nodoc
class _$BankCardCopyWithImpl<$Res>
    implements $BankCardCopyWith<$Res> {
  _$BankCardCopyWithImpl(this._self, this._then);

  final BankCard _self;
  final $Res Function(BankCard) _then;

/// Create a copy of BankCard
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? cardUserId = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expirationDate = null,}) {
  return _then(_self.copyWith(
cardUserId: null == cardUserId ? _self.cardUserId : cardUserId // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [BankCard].
extension BankCardPatterns on BankCard {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BankCard value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BankCard() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BankCard value)  $default,){
final _that = this;
switch (_that) {
case _BankCard():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BankCard value)?  $default,){
final _that = this;
switch (_that) {
case _BankCard() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String cardUserId,  String cardNumber,  String cardHolderName,  String expirationDate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BankCard() when $default != null:
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String cardUserId,  String cardNumber,  String cardHolderName,  String expirationDate)  $default,) {final _that = this;
switch (_that) {
case _BankCard():
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String cardUserId,  String cardNumber,  String cardHolderName,  String expirationDate)?  $default,) {final _that = this;
switch (_that) {
case _BankCard() when $default != null:
return $default(_that.cardUserId,_that.cardNumber,_that.cardHolderName,_that.expirationDate);case _:
  return null;

}
}

}

/// @nodoc


class _BankCard implements BankCard {
  const _BankCard({required this.cardUserId, required this.cardNumber, required this.cardHolderName, required this.expirationDate});
  

@override final  String cardUserId;
@override final  String cardNumber;
@override final  String cardHolderName;
@override final  String expirationDate;

/// Create a copy of BankCard
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BankCardCopyWith<_BankCard> get copyWith => __$BankCardCopyWithImpl<_BankCard>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BankCard&&(identical(other.cardUserId, cardUserId) || other.cardUserId == cardUserId)&&(identical(other.cardNumber, cardNumber) || other.cardNumber == cardNumber)&&(identical(other.cardHolderName, cardHolderName) || other.cardHolderName == cardHolderName)&&(identical(other.expirationDate, expirationDate) || other.expirationDate == expirationDate));
}


@override
int get hashCode => Object.hash(runtimeType,cardUserId,cardNumber,cardHolderName,expirationDate);

@override
String toString() {
  return 'BankCard(cardUserId: $cardUserId, cardNumber: $cardNumber, cardHolderName: $cardHolderName, expirationDate: $expirationDate)';
}


}

/// @nodoc
abstract mixin class _$BankCardCopyWith<$Res> implements $BankCardCopyWith<$Res> {
  factory _$BankCardCopyWith(_BankCard value, $Res Function(_BankCard) _then) = __$BankCardCopyWithImpl;
@override @useResult
$Res call({
 String cardUserId, String cardNumber, String cardHolderName, String expirationDate
});




}
/// @nodoc
class __$BankCardCopyWithImpl<$Res>
    implements _$BankCardCopyWith<$Res> {
  __$BankCardCopyWithImpl(this._self, this._then);

  final _BankCard _self;
  final $Res Function(_BankCard) _then;

/// Create a copy of BankCard
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? cardUserId = null,Object? cardNumber = null,Object? cardHolderName = null,Object? expirationDate = null,}) {
  return _then(_BankCard(
cardUserId: null == cardUserId ? _self.cardUserId : cardUserId // ignore: cast_nullable_to_non_nullable
as String,cardNumber: null == cardNumber ? _self.cardNumber : cardNumber // ignore: cast_nullable_to_non_nullable
as String,cardHolderName: null == cardHolderName ? _self.cardHolderName : cardHolderName // ignore: cast_nullable_to_non_nullable
as String,expirationDate: null == expirationDate ? _self.expirationDate : expirationDate // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
