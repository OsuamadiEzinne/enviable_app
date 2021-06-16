// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  _Auth call(
      {bool isLoading = false,
      bool isResendingCode = false,
      bool validate = false,
      required DisplayName displayName,
      required EmailAddress emailAddress,
      required Phone phone,
      required OTPCode code,
      PhoneVerification? verification,
      Country country = Country.DEFAULT,
      Option<Either<AuthFailure, Unit>> authStatus = const None()}) {
    return _Auth(
      isLoading: isLoading,
      isResendingCode: isResendingCode,
      validate: validate,
      displayName: displayName,
      emailAddress: emailAddress,
      phone: phone,
      code: code,
      verification: verification,
      country: country,
      authStatus: authStatus,
    );
  }
}

/// @nodoc
const $AuthState = _$AuthStateTearOff();

/// @nodoc
mixin _$AuthState {
  bool get isLoading => throw _privateConstructorUsedError;
  bool get isResendingCode => throw _privateConstructorUsedError;
  bool get validate => throw _privateConstructorUsedError;
  DisplayName get displayName => throw _privateConstructorUsedError;
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  Phone get phone => throw _privateConstructorUsedError;
  OTPCode get code => throw _privateConstructorUsedError;
  PhoneVerification? get verification => throw _privateConstructorUsedError;
  Country get country => throw _privateConstructorUsedError;
  Option<Either<AuthFailure, Unit>> get authStatus =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthStateCopyWith<AuthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      bool isResendingCode,
      bool validate,
      DisplayName displayName,
      EmailAddress emailAddress,
      Phone phone,
      OTPCode code,
      PhoneVerification? verification,
      Country country,
      Option<Either<AuthFailure, Unit>> authStatus});

  $PhoneVerificationCopyWith<$Res>? get verification;
  $CountryCopyWith<$Res> get country;
}

/// @nodoc
class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isResendingCode = freezed,
    Object? validate = freezed,
    Object? displayName = freezed,
    Object? emailAddress = freezed,
    Object? phone = freezed,
    Object? code = freezed,
    Object? verification = freezed,
    Object? country = freezed,
    Object? authStatus = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResendingCode: isResendingCode == freezed
          ? _value.isResendingCode
          : isResendingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as OTPCode,
      verification: verification == freezed
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as PhoneVerification?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      authStatus: authStatus == freezed
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }

  @override
  $PhoneVerificationCopyWith<$Res>? get verification {
    if (_value.verification == null) {
      return null;
    }

    return $PhoneVerificationCopyWith<$Res>(_value.verification!, (value) {
      return _then(_value.copyWith(verification: value));
    });
  }

  @override
  $CountryCopyWith<$Res> get country {
    return $CountryCopyWith<$Res>(_value.country, (value) {
      return _then(_value.copyWith(country: value));
    });
  }
}

/// @nodoc
abstract class _$AuthCopyWith<$Res> implements $AuthStateCopyWith<$Res> {
  factory _$AuthCopyWith(_Auth value, $Res Function(_Auth) then) =
      __$AuthCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      bool isResendingCode,
      bool validate,
      DisplayName displayName,
      EmailAddress emailAddress,
      Phone phone,
      OTPCode code,
      PhoneVerification? verification,
      Country country,
      Option<Either<AuthFailure, Unit>> authStatus});

  @override
  $PhoneVerificationCopyWith<$Res>? get verification;
  @override
  $CountryCopyWith<$Res> get country;
}

/// @nodoc
class __$AuthCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements _$AuthCopyWith<$Res> {
  __$AuthCopyWithImpl(_Auth _value, $Res Function(_Auth) _then)
      : super(_value, (v) => _then(v as _Auth));

  @override
  _Auth get _value => super._value as _Auth;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? isResendingCode = freezed,
    Object? validate = freezed,
    Object? displayName = freezed,
    Object? emailAddress = freezed,
    Object? phone = freezed,
    Object? code = freezed,
    Object? verification = freezed,
    Object? country = freezed,
    Object? authStatus = freezed,
  }) {
    return _then(_Auth(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      isResendingCode: isResendingCode == freezed
          ? _value.isResendingCode
          : isResendingCode // ignore: cast_nullable_to_non_nullable
              as bool,
      validate: validate == freezed
          ? _value.validate
          : validate // ignore: cast_nullable_to_non_nullable
              as bool,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as DisplayName,
      emailAddress: emailAddress == freezed
          ? _value.emailAddress
          : emailAddress // ignore: cast_nullable_to_non_nullable
              as EmailAddress,
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      code: code == freezed
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as OTPCode,
      verification: verification == freezed
          ? _value.verification
          : verification // ignore: cast_nullable_to_non_nullable
              as PhoneVerification?,
      country: country == freezed
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as Country,
      authStatus: authStatus == freezed
          ? _value.authStatus
          : authStatus // ignore: cast_nullable_to_non_nullable
              as Option<Either<AuthFailure, Unit>>,
    ));
  }
}

/// @nodoc

class _$_Auth extends _Auth {
  const _$_Auth(
      {this.isLoading = false,
      this.isResendingCode = false,
      this.validate = false,
      required this.displayName,
      required this.emailAddress,
      required this.phone,
      required this.code,
      this.verification,
      this.country = Country.DEFAULT,
      this.authStatus = const None()})
      : super._();

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @JsonKey(defaultValue: false)
  @override
  final bool isResendingCode;
  @JsonKey(defaultValue: false)
  @override
  final bool validate;
  @override
  final DisplayName displayName;
  @override
  final EmailAddress emailAddress;
  @override
  final Phone phone;
  @override
  final OTPCode code;
  @override
  final PhoneVerification? verification;
  @JsonKey(defaultValue: Country.DEFAULT)
  @override
  final Country country;
  @JsonKey(defaultValue: const None())
  @override
  final Option<Either<AuthFailure, Unit>> authStatus;

  @override
  String toString() {
    return 'AuthState(isLoading: $isLoading, isResendingCode: $isResendingCode, validate: $validate, displayName: $displayName, emailAddress: $emailAddress, phone: $phone, code: $code, verification: $verification, country: $country, authStatus: $authStatus)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _Auth &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.isResendingCode, isResendingCode) ||
                const DeepCollectionEquality()
                    .equals(other.isResendingCode, isResendingCode)) &&
            (identical(other.validate, validate) ||
                const DeepCollectionEquality()
                    .equals(other.validate, validate)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.code, code) ||
                const DeepCollectionEquality().equals(other.code, code)) &&
            (identical(other.verification, verification) ||
                const DeepCollectionEquality()
                    .equals(other.verification, verification)) &&
            (identical(other.country, country) ||
                const DeepCollectionEquality()
                    .equals(other.country, country)) &&
            (identical(other.authStatus, authStatus) ||
                const DeepCollectionEquality()
                    .equals(other.authStatus, authStatus)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(isResendingCode) ^
      const DeepCollectionEquality().hash(validate) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(code) ^
      const DeepCollectionEquality().hash(verification) ^
      const DeepCollectionEquality().hash(country) ^
      const DeepCollectionEquality().hash(authStatus);

  @JsonKey(ignore: true)
  @override
  _$AuthCopyWith<_Auth> get copyWith =>
      __$AuthCopyWithImpl<_Auth>(this, _$identity);
}

abstract class _Auth extends AuthState {
  const factory _Auth(
      {bool isLoading,
      bool isResendingCode,
      bool validate,
      required DisplayName displayName,
      required EmailAddress emailAddress,
      required Phone phone,
      required OTPCode code,
      PhoneVerification? verification,
      Country country,
      Option<Either<AuthFailure, Unit>> authStatus}) = _$_Auth;
  const _Auth._() : super._();

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  bool get isResendingCode => throw _privateConstructorUsedError;
  @override
  bool get validate => throw _privateConstructorUsedError;
  @override
  DisplayName get displayName => throw _privateConstructorUsedError;
  @override
  EmailAddress get emailAddress => throw _privateConstructorUsedError;
  @override
  Phone get phone => throw _privateConstructorUsedError;
  @override
  OTPCode get code => throw _privateConstructorUsedError;
  @override
  PhoneVerification? get verification => throw _privateConstructorUsedError;
  @override
  Country get country => throw _privateConstructorUsedError;
  @override
  Option<Either<AuthFailure, Unit>> get authStatus =>
      throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthCopyWith<_Auth> get copyWith => throw _privateConstructorUsedError;
}
