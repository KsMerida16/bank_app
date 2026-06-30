// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AccountModel {

@JsonKey(name: 'user_id') String get accountUserId;@JsonKey(name: 'number') String get accountNumber;@JsonKey(name: 'type') String get accountType;@JsonKey(name: 'currency') num get accountCurrency;@JsonKey(name: 'name') String get accountName;@JsonKey(name: 'balance') double get accountBalance;
/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AccountModelCopyWith<AccountModel> get copyWith => _$AccountModelCopyWithImpl<AccountModel>(this as AccountModel, _$identity);

  /// Serializes this AccountModel to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AccountModel&&(identical(other.accountUserId, accountUserId) || other.accountUserId == accountUserId)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountCurrency, accountCurrency) || other.accountCurrency == accountCurrency)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountUserId,accountNumber,accountType,accountCurrency,accountName,accountBalance);

@override
String toString() {
  return 'AccountModel(accountUserId: $accountUserId, accountNumber: $accountNumber, accountType: $accountType, accountCurrency: $accountCurrency, accountName: $accountName, accountBalance: $accountBalance)';
}


}

/// @nodoc
abstract mixin class $AccountModelCopyWith<$Res>  {
  factory $AccountModelCopyWith(AccountModel value, $Res Function(AccountModel) _then) = _$AccountModelCopyWithImpl;
@useResult
$Res call({
@JsonKey(name: 'user_id') String accountUserId,@JsonKey(name: 'number') String accountNumber,@JsonKey(name: 'type') String accountType,@JsonKey(name: 'currency') num accountCurrency,@JsonKey(name: 'name') String accountName,@JsonKey(name: 'balance') double accountBalance
});




}
/// @nodoc
class _$AccountModelCopyWithImpl<$Res>
    implements $AccountModelCopyWith<$Res> {
  _$AccountModelCopyWithImpl(this._self, this._then);

  final AccountModel _self;
  final $Res Function(AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? accountUserId = null,Object? accountNumber = null,Object? accountType = null,Object? accountCurrency = null,Object? accountName = null,Object? accountBalance = null,}) {
  return _then(_self.copyWith(
accountUserId: null == accountUserId ? _self.accountUserId : accountUserId // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,accountCurrency: null == accountCurrency ? _self.accountCurrency : accountCurrency // ignore: cast_nullable_to_non_nullable
as num,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [AccountModel].
extension AccountModelPatterns on AccountModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AccountModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AccountModel value)  $default,){
final _that = this;
switch (_that) {
case _AccountModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AccountModel value)?  $default,){
final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String accountUserId, @JsonKey(name: 'number')  String accountNumber, @JsonKey(name: 'type')  String accountType, @JsonKey(name: 'currency')  num accountCurrency, @JsonKey(name: 'name')  String accountName, @JsonKey(name: 'balance')  double accountBalance)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.accountUserId,_that.accountNumber,_that.accountType,_that.accountCurrency,_that.accountName,_that.accountBalance);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(name: 'user_id')  String accountUserId, @JsonKey(name: 'number')  String accountNumber, @JsonKey(name: 'type')  String accountType, @JsonKey(name: 'currency')  num accountCurrency, @JsonKey(name: 'name')  String accountName, @JsonKey(name: 'balance')  double accountBalance)  $default,) {final _that = this;
switch (_that) {
case _AccountModel():
return $default(_that.accountUserId,_that.accountNumber,_that.accountType,_that.accountCurrency,_that.accountName,_that.accountBalance);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(name: 'user_id')  String accountUserId, @JsonKey(name: 'number')  String accountNumber, @JsonKey(name: 'type')  String accountType, @JsonKey(name: 'currency')  num accountCurrency, @JsonKey(name: 'name')  String accountName, @JsonKey(name: 'balance')  double accountBalance)?  $default,) {final _that = this;
switch (_that) {
case _AccountModel() when $default != null:
return $default(_that.accountUserId,_that.accountNumber,_that.accountType,_that.accountCurrency,_that.accountName,_that.accountBalance);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AccountModel implements AccountModel {
   _AccountModel({@JsonKey(name: 'user_id') required this.accountUserId, @JsonKey(name: 'number') required this.accountNumber, @JsonKey(name: 'type') required this.accountType, @JsonKey(name: 'currency') required this.accountCurrency, @JsonKey(name: 'name') required this.accountName, @JsonKey(name: 'balance') required this.accountBalance});
  factory _AccountModel.fromJson(Map<String, dynamic> json) => _$AccountModelFromJson(json);

@override@JsonKey(name: 'user_id') final  String accountUserId;
@override@JsonKey(name: 'number') final  String accountNumber;
@override@JsonKey(name: 'type') final  String accountType;
@override@JsonKey(name: 'currency') final  num accountCurrency;
@override@JsonKey(name: 'name') final  String accountName;
@override@JsonKey(name: 'balance') final  double accountBalance;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AccountModelCopyWith<_AccountModel> get copyWith => __$AccountModelCopyWithImpl<_AccountModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AccountModelToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AccountModel&&(identical(other.accountUserId, accountUserId) || other.accountUserId == accountUserId)&&(identical(other.accountNumber, accountNumber) || other.accountNumber == accountNumber)&&(identical(other.accountType, accountType) || other.accountType == accountType)&&(identical(other.accountCurrency, accountCurrency) || other.accountCurrency == accountCurrency)&&(identical(other.accountName, accountName) || other.accountName == accountName)&&(identical(other.accountBalance, accountBalance) || other.accountBalance == accountBalance));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,accountUserId,accountNumber,accountType,accountCurrency,accountName,accountBalance);

@override
String toString() {
  return 'AccountModel(accountUserId: $accountUserId, accountNumber: $accountNumber, accountType: $accountType, accountCurrency: $accountCurrency, accountName: $accountName, accountBalance: $accountBalance)';
}


}

/// @nodoc
abstract mixin class _$AccountModelCopyWith<$Res> implements $AccountModelCopyWith<$Res> {
  factory _$AccountModelCopyWith(_AccountModel value, $Res Function(_AccountModel) _then) = __$AccountModelCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(name: 'user_id') String accountUserId,@JsonKey(name: 'number') String accountNumber,@JsonKey(name: 'type') String accountType,@JsonKey(name: 'currency') num accountCurrency,@JsonKey(name: 'name') String accountName,@JsonKey(name: 'balance') double accountBalance
});




}
/// @nodoc
class __$AccountModelCopyWithImpl<$Res>
    implements _$AccountModelCopyWith<$Res> {
  __$AccountModelCopyWithImpl(this._self, this._then);

  final _AccountModel _self;
  final $Res Function(_AccountModel) _then;

/// Create a copy of AccountModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? accountUserId = null,Object? accountNumber = null,Object? accountType = null,Object? accountCurrency = null,Object? accountName = null,Object? accountBalance = null,}) {
  return _then(_AccountModel(
accountUserId: null == accountUserId ? _self.accountUserId : accountUserId // ignore: cast_nullable_to_non_nullable
as String,accountNumber: null == accountNumber ? _self.accountNumber : accountNumber // ignore: cast_nullable_to_non_nullable
as String,accountType: null == accountType ? _self.accountType : accountType // ignore: cast_nullable_to_non_nullable
as String,accountCurrency: null == accountCurrency ? _self.accountCurrency : accountCurrency // ignore: cast_nullable_to_non_nullable
as num,accountName: null == accountName ? _self.accountName : accountName // ignore: cast_nullable_to_non_nullable
as String,accountBalance: null == accountBalance ? _self.accountBalance : accountBalance // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
