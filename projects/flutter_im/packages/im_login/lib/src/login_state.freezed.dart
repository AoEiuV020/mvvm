// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LoginState {

 String get countryCode; String get phone; String? get phoneError; String get password; String? get passwordError; bool get isPasswordVisible; bool get isLoading; String? get errorMessage;/// 待选用户列表（非空时表示需要用户选择）
 List<UserOption>? get pendingUsers;
/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginStateCopyWith<LoginState> get copyWith => _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginState&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneError, phoneError) || other.phoneError == phoneError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other.pendingUsers, pendingUsers));
}


@override
int get hashCode => Object.hash(runtimeType,countryCode,phone,phoneError,password,passwordError,isPasswordVisible,isLoading,errorMessage,const DeepCollectionEquality().hash(pendingUsers));

@override
String toString() {
  return 'LoginState(countryCode: $countryCode, phone: $phone, phoneError: $phoneError, password: $password, passwordError: $passwordError, isPasswordVisible: $isPasswordVisible, isLoading: $isLoading, errorMessage: $errorMessage, pendingUsers: $pendingUsers)';
}


}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res>  {
  factory $LoginStateCopyWith(LoginState value, $Res Function(LoginState) _then) = _$LoginStateCopyWithImpl;
@useResult
$Res call({
 String countryCode, String phone, String? phoneError, String password, String? passwordError, bool isPasswordVisible, bool isLoading, String? errorMessage, List<UserOption>? pendingUsers
});




}
/// @nodoc
class _$LoginStateCopyWithImpl<$Res>
    implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? countryCode = null,Object? phone = null,Object? phoneError = freezed,Object? password = null,Object? passwordError = freezed,Object? isPasswordVisible = null,Object? isLoading = null,Object? errorMessage = freezed,Object? pendingUsers = freezed,}) {
  return _then(_self.copyWith(
countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneError: freezed == phoneError ? _self.phoneError : phoneError // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingUsers: freezed == pendingUsers ? _self.pendingUsers : pendingUsers // ignore: cast_nullable_to_non_nullable
as List<UserOption>?,
  ));
}

}


/// Adds pattern-matching-related methods to [LoginState].
extension LoginStatePatterns on LoginState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginState value)  $default,){
final _that = this;
switch (_that) {
case _LoginState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginState value)?  $default,){
final _that = this;
switch (_that) {
case _LoginState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String countryCode,  String phone,  String? phoneError,  String password,  String? passwordError,  bool isPasswordVisible,  bool isLoading,  String? errorMessage,  List<UserOption>? pendingUsers)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.countryCode,_that.phone,_that.phoneError,_that.password,_that.passwordError,_that.isPasswordVisible,_that.isLoading,_that.errorMessage,_that.pendingUsers);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String countryCode,  String phone,  String? phoneError,  String password,  String? passwordError,  bool isPasswordVisible,  bool isLoading,  String? errorMessage,  List<UserOption>? pendingUsers)  $default,) {final _that = this;
switch (_that) {
case _LoginState():
return $default(_that.countryCode,_that.phone,_that.phoneError,_that.password,_that.passwordError,_that.isPasswordVisible,_that.isLoading,_that.errorMessage,_that.pendingUsers);case _:
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String countryCode,  String phone,  String? phoneError,  String password,  String? passwordError,  bool isPasswordVisible,  bool isLoading,  String? errorMessage,  List<UserOption>? pendingUsers)?  $default,) {final _that = this;
switch (_that) {
case _LoginState() when $default != null:
return $default(_that.countryCode,_that.phone,_that.phoneError,_that.password,_that.passwordError,_that.isPasswordVisible,_that.isLoading,_that.errorMessage,_that.pendingUsers);case _:
  return null;

}
}

}

/// @nodoc


class _LoginState implements LoginState {
  const _LoginState({this.countryCode = '+86', this.phone = '', this.phoneError, this.password = '', this.passwordError, this.isPasswordVisible = false, this.isLoading = false, this.errorMessage, final  List<UserOption>? pendingUsers}): _pendingUsers = pendingUsers;
  

@override@JsonKey() final  String countryCode;
@override@JsonKey() final  String phone;
@override final  String? phoneError;
@override@JsonKey() final  String password;
@override final  String? passwordError;
@override@JsonKey() final  bool isPasswordVisible;
@override@JsonKey() final  bool isLoading;
@override final  String? errorMessage;
/// 待选用户列表（非空时表示需要用户选择）
 final  List<UserOption>? _pendingUsers;
/// 待选用户列表（非空时表示需要用户选择）
@override List<UserOption>? get pendingUsers {
  final value = _pendingUsers;
  if (value == null) return null;
  if (_pendingUsers is EqualUnmodifiableListView) return _pendingUsers;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}


/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginStateCopyWith<_LoginState> get copyWith => __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginState&&(identical(other.countryCode, countryCode) || other.countryCode == countryCode)&&(identical(other.phone, phone) || other.phone == phone)&&(identical(other.phoneError, phoneError) || other.phoneError == phoneError)&&(identical(other.password, password) || other.password == password)&&(identical(other.passwordError, passwordError) || other.passwordError == passwordError)&&(identical(other.isPasswordVisible, isPasswordVisible) || other.isPasswordVisible == isPasswordVisible)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.errorMessage, errorMessage) || other.errorMessage == errorMessage)&&const DeepCollectionEquality().equals(other._pendingUsers, _pendingUsers));
}


@override
int get hashCode => Object.hash(runtimeType,countryCode,phone,phoneError,password,passwordError,isPasswordVisible,isLoading,errorMessage,const DeepCollectionEquality().hash(_pendingUsers));

@override
String toString() {
  return 'LoginState(countryCode: $countryCode, phone: $phone, phoneError: $phoneError, password: $password, passwordError: $passwordError, isPasswordVisible: $isPasswordVisible, isLoading: $isLoading, errorMessage: $errorMessage, pendingUsers: $pendingUsers)';
}


}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res> implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(_LoginState value, $Res Function(_LoginState) _then) = __$LoginStateCopyWithImpl;
@override @useResult
$Res call({
 String countryCode, String phone, String? phoneError, String password, String? passwordError, bool isPasswordVisible, bool isLoading, String? errorMessage, List<UserOption>? pendingUsers
});




}
/// @nodoc
class __$LoginStateCopyWithImpl<$Res>
    implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

/// Create a copy of LoginState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? countryCode = null,Object? phone = null,Object? phoneError = freezed,Object? password = null,Object? passwordError = freezed,Object? isPasswordVisible = null,Object? isLoading = null,Object? errorMessage = freezed,Object? pendingUsers = freezed,}) {
  return _then(_LoginState(
countryCode: null == countryCode ? _self.countryCode : countryCode // ignore: cast_nullable_to_non_nullable
as String,phone: null == phone ? _self.phone : phone // ignore: cast_nullable_to_non_nullable
as String,phoneError: freezed == phoneError ? _self.phoneError : phoneError // ignore: cast_nullable_to_non_nullable
as String?,password: null == password ? _self.password : password // ignore: cast_nullable_to_non_nullable
as String,passwordError: freezed == passwordError ? _self.passwordError : passwordError // ignore: cast_nullable_to_non_nullable
as String?,isPasswordVisible: null == isPasswordVisible ? _self.isPasswordVisible : isPasswordVisible // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,errorMessage: freezed == errorMessage ? _self.errorMessage : errorMessage // ignore: cast_nullable_to_non_nullable
as String?,pendingUsers: freezed == pendingUsers ? _self._pendingUsers : pendingUsers // ignore: cast_nullable_to_non_nullable
as List<UserOption>?,
  ));
}


}

// dart format on
