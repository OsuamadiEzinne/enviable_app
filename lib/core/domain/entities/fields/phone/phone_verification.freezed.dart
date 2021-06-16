// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of phone_verification.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$PhoneVerificationTearOff {
  const _$PhoneVerificationTearOff();

  _PhoneVerification call(
      {required Phone phone,
      PhoneAuthCredential? credential,
      bool verified = false,
      FirebaseAuthException? exception,
      required String verificationId,
      bool codeSent = false,
      int? resendToken,
      bool autoRetrievalTimedout = false}) {
    return _PhoneVerification(
      phone: phone,
      credential: credential,
      verified: verified,
      exception: exception,
      verificationId: verificationId,
      codeSent: codeSent,
      resendToken: resendToken,
      autoRetrievalTimedout: autoRetrievalTimedout,
    );
  }
}

/// @nodoc
const $PhoneVerification = _$PhoneVerificationTearOff();

/// @nodoc
mixin _$PhoneVerification {
  Phone get phone => throw _privateConstructorUsedError;
  PhoneAuthCredential? get credential => throw _privateConstructorUsedError;
  bool get verified => throw _privateConstructorUsedError;
  FirebaseAuthException? get exception => throw _privateConstructorUsedError;
  String get verificationId => throw _privateConstructorUsedError;
  bool get codeSent => throw _privateConstructorUsedError;
  int? get resendToken => throw _privateConstructorUsedError;
  bool get autoRetrievalTimedout => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PhoneVerificationCopyWith<PhoneVerification> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PhoneVerificationCopyWith<$Res> {
  factory $PhoneVerificationCopyWith(
          PhoneVerification value, $Res Function(PhoneVerification) then) =
      _$PhoneVerificationCopyWithImpl<$Res>;
  $Res call(
      {Phone phone,
      PhoneAuthCredential? credential,
      bool verified,
      FirebaseAuthException? exception,
      String verificationId,
      bool codeSent,
      int? resendToken,
      bool autoRetrievalTimedout});
}

/// @nodoc
class _$PhoneVerificationCopyWithImpl<$Res>
    implements $PhoneVerificationCopyWith<$Res> {
  _$PhoneVerificationCopyWithImpl(this._value, this._then);

  final PhoneVerification _value;
  // ignore: unused_field
  final $Res Function(PhoneVerification) _then;

  @override
  $Res call({
    Object? phone = freezed,
    Object? credential = freezed,
    Object? verified = freezed,
    Object? exception = freezed,
    Object? verificationId = freezed,
    Object? codeSent = freezed,
    Object? resendToken = freezed,
    Object? autoRetrievalTimedout = freezed,
  }) {
    return _then(_value.copyWith(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      codeSent: codeSent == freezed
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      resendToken: resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      autoRetrievalTimedout: autoRetrievalTimedout == freezed
          ? _value.autoRetrievalTimedout
          : autoRetrievalTimedout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
abstract class _$PhoneVerificationCopyWith<$Res>
    implements $PhoneVerificationCopyWith<$Res> {
  factory _$PhoneVerificationCopyWith(
          _PhoneVerification value, $Res Function(_PhoneVerification) then) =
      __$PhoneVerificationCopyWithImpl<$Res>;
  @override
  $Res call(
      {Phone phone,
      PhoneAuthCredential? credential,
      bool verified,
      FirebaseAuthException? exception,
      String verificationId,
      bool codeSent,
      int? resendToken,
      bool autoRetrievalTimedout});
}

/// @nodoc
class __$PhoneVerificationCopyWithImpl<$Res>
    extends _$PhoneVerificationCopyWithImpl<$Res>
    implements _$PhoneVerificationCopyWith<$Res> {
  __$PhoneVerificationCopyWithImpl(
      _PhoneVerification _value, $Res Function(_PhoneVerification) _then)
      : super(_value, (v) => _then(v as _PhoneVerification));

  @override
  _PhoneVerification get _value => super._value as _PhoneVerification;

  @override
  $Res call({
    Object? phone = freezed,
    Object? credential = freezed,
    Object? verified = freezed,
    Object? exception = freezed,
    Object? verificationId = freezed,
    Object? codeSent = freezed,
    Object? resendToken = freezed,
    Object? autoRetrievalTimedout = freezed,
  }) {
    return _then(_PhoneVerification(
      phone: phone == freezed
          ? _value.phone
          : phone // ignore: cast_nullable_to_non_nullable
              as Phone,
      credential: credential == freezed
          ? _value.credential
          : credential // ignore: cast_nullable_to_non_nullable
              as PhoneAuthCredential?,
      verified: verified == freezed
          ? _value.verified
          : verified // ignore: cast_nullable_to_non_nullable
              as bool,
      exception: exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as FirebaseAuthException?,
      verificationId: verificationId == freezed
          ? _value.verificationId
          : verificationId // ignore: cast_nullable_to_non_nullable
              as String,
      codeSent: codeSent == freezed
          ? _value.codeSent
          : codeSent // ignore: cast_nullable_to_non_nullable
              as bool,
      resendToken: resendToken == freezed
          ? _value.resendToken
          : resendToken // ignore: cast_nullable_to_non_nullable
              as int?,
      autoRetrievalTimedout: autoRetrievalTimedout == freezed
          ? _value.autoRetrievalTimedout
          : autoRetrievalTimedout // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_PhoneVerification implements _PhoneVerification {
  const _$_PhoneVerification(
      {required this.phone,
      this.credential,
      this.verified = false,
      this.exception,
      required this.verificationId,
      this.codeSent = false,
      this.resendToken,
      this.autoRetrievalTimedout = false});

  @override
  final Phone phone;
  @override
  final PhoneAuthCredential? credential;
  @JsonKey(defaultValue: false)
  @override
  final bool verified;
  @override
  final FirebaseAuthException? exception;
  @override
  final String verificationId;
  @JsonKey(defaultValue: false)
  @override
  final bool codeSent;
  @override
  final int? resendToken;
  @JsonKey(defaultValue: false)
  @override
  final bool autoRetrievalTimedout;

  @override
  String toString() {
    return 'PhoneVerification(phone: $phone, credential: $credential, verified: $verified, exception: $exception, verificationId: $verificationId, codeSent: $codeSent, resendToken: $resendToken, autoRetrievalTimedout: $autoRetrievalTimedout)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _PhoneVerification &&
            (identical(other.phone, phone) ||
                const DeepCollectionEquality().equals(other.phone, phone)) &&
            (identical(other.credential, credential) ||
                const DeepCollectionEquality()
                    .equals(other.credential, credential)) &&
            (identical(other.verified, verified) ||
                const DeepCollectionEquality()
                    .equals(other.verified, verified)) &&
            (identical(other.exception, exception) ||
                const DeepCollectionEquality()
                    .equals(other.exception, exception)) &&
            (identical(other.verificationId, verificationId) ||
                const DeepCollectionEquality()
                    .equals(other.verificationId, verificationId)) &&
            (identical(other.codeSent, codeSent) ||
                const DeepCollectionEquality()
                    .equals(other.codeSent, codeSent)) &&
            (identical(other.resendToken, resendToken) ||
                const DeepCollectionEquality()
                    .equals(other.resendToken, resendToken)) &&
            (identical(other.autoRetrievalTimedout, autoRetrievalTimedout) ||
                const DeepCollectionEquality().equals(
                    other.autoRetrievalTimedout, autoRetrievalTimedout)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(phone) ^
      const DeepCollectionEquality().hash(credential) ^
      const DeepCollectionEquality().hash(verified) ^
      const DeepCollectionEquality().hash(exception) ^
      const DeepCollectionEquality().hash(verificationId) ^
      const DeepCollectionEquality().hash(codeSent) ^
      const DeepCollectionEquality().hash(resendToken) ^
      const DeepCollectionEquality().hash(autoRetrievalTimedout);

  @JsonKey(ignore: true)
  @override
  _$PhoneVerificationCopyWith<_PhoneVerification> get copyWith =>
      __$PhoneVerificationCopyWithImpl<_PhoneVerification>(this, _$identity);
}

abstract class _PhoneVerification implements PhoneVerification {
  const factory _PhoneVerification(
      {required Phone phone,
      PhoneAuthCredential? credential,
      bool verified,
      FirebaseAuthException? exception,
      required String verificationId,
      bool codeSent,
      int? resendToken,
      bool autoRetrievalTimedout}) = _$_PhoneVerification;

  @override
  Phone get phone => throw _privateConstructorUsedError;
  @override
  PhoneAuthCredential? get credential => throw _privateConstructorUsedError;
  @override
  bool get verified => throw _privateConstructorUsedError;
  @override
  FirebaseAuthException? get exception => throw _privateConstructorUsedError;
  @override
  String get verificationId => throw _privateConstructorUsedError;
  @override
  bool get codeSent => throw _privateConstructorUsedError;
  @override
  int? get resendToken => throw _privateConstructorUsedError;
  @override
  bool get autoRetrievalTimedout => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$PhoneVerificationCopyWith<_PhoneVerification> get copyWith =>
      throw _privateConstructorUsedError;
}
