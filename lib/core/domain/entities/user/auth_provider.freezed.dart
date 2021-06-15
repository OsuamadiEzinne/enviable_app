// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of auth_provider.dart;

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthProviderTearOff {
  const _$AuthProviderTearOff();

  _AuthProvider call(
      {String? id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? providerId}) {
    return _AuthProvider(
      id: id,
      displayName: displayName,
      email: email,
      phoneNumber: phoneNumber,
      photoURL: photoURL,
      providerId: providerId,
    );
  }
}

/// @nodoc
const $AuthProvider = _$AuthProviderTearOff();

/// @nodoc
mixin _$AuthProvider {
  String? get id => throw _privateConstructorUsedError;
  String? get displayName => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get phoneNumber => throw _privateConstructorUsedError;
  String? get photoURL => throw _privateConstructorUsedError;
  String? get providerId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthProviderCopyWith<AuthProvider> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthProviderCopyWith<$Res> {
  factory $AuthProviderCopyWith(
          AuthProvider value, $Res Function(AuthProvider) then) =
      _$AuthProviderCopyWithImpl<$Res>;
  $Res call(
      {String? id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? providerId});
}

/// @nodoc
class _$AuthProviderCopyWithImpl<$Res> implements $AuthProviderCopyWith<$Res> {
  _$AuthProviderCopyWithImpl(this._value, this._then);

  final AuthProvider _value;
  // ignore: unused_field
  final $Res Function(AuthProvider) _then;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoURL = freezed,
    Object? providerId = freezed,
  }) {
    return _then(_value.copyWith(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: providerId == freezed
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
abstract class _$AuthProviderCopyWith<$Res>
    implements $AuthProviderCopyWith<$Res> {
  factory _$AuthProviderCopyWith(
          _AuthProvider value, $Res Function(_AuthProvider) then) =
      __$AuthProviderCopyWithImpl<$Res>;
  @override
  $Res call(
      {String? id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? providerId});
}

/// @nodoc
class __$AuthProviderCopyWithImpl<$Res> extends _$AuthProviderCopyWithImpl<$Res>
    implements _$AuthProviderCopyWith<$Res> {
  __$AuthProviderCopyWithImpl(
      _AuthProvider _value, $Res Function(_AuthProvider) _then)
      : super(_value, (v) => _then(v as _AuthProvider));

  @override
  _AuthProvider get _value => super._value as _AuthProvider;

  @override
  $Res call({
    Object? id = freezed,
    Object? displayName = freezed,
    Object? email = freezed,
    Object? phoneNumber = freezed,
    Object? photoURL = freezed,
    Object? providerId = freezed,
  }) {
    return _then(_AuthProvider(
      id: id == freezed
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      displayName: displayName == freezed
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String?,
      email: email == freezed
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: phoneNumber == freezed
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      photoURL: photoURL == freezed
          ? _value.photoURL
          : photoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      providerId: providerId == freezed
          ? _value.providerId
          : providerId // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$_AuthProvider extends _AuthProvider {
  const _$_AuthProvider(
      {this.id,
      this.displayName,
      this.email,
      this.phoneNumber,
      this.photoURL,
      this.providerId})
      : super._();

  @override
  final String? id;
  @override
  final String? displayName;
  @override
  final String? email;
  @override
  final String? phoneNumber;
  @override
  final String? photoURL;
  @override
  final String? providerId;

  @override
  String toString() {
    return 'AuthProvider(id: $id, displayName: $displayName, email: $email, phoneNumber: $phoneNumber, photoURL: $photoURL, providerId: $providerId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthProvider &&
            (identical(other.id, id) ||
                const DeepCollectionEquality().equals(other.id, id)) &&
            (identical(other.displayName, displayName) ||
                const DeepCollectionEquality()
                    .equals(other.displayName, displayName)) &&
            (identical(other.email, email) ||
                const DeepCollectionEquality().equals(other.email, email)) &&
            (identical(other.phoneNumber, phoneNumber) ||
                const DeepCollectionEquality()
                    .equals(other.phoneNumber, phoneNumber)) &&
            (identical(other.photoURL, photoURL) ||
                const DeepCollectionEquality()
                    .equals(other.photoURL, photoURL)) &&
            (identical(other.providerId, providerId) ||
                const DeepCollectionEquality()
                    .equals(other.providerId, providerId)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(id) ^
      const DeepCollectionEquality().hash(displayName) ^
      const DeepCollectionEquality().hash(email) ^
      const DeepCollectionEquality().hash(phoneNumber) ^
      const DeepCollectionEquality().hash(photoURL) ^
      const DeepCollectionEquality().hash(providerId);

  @JsonKey(ignore: true)
  @override
  _$AuthProviderCopyWith<_AuthProvider> get copyWith =>
      __$AuthProviderCopyWithImpl<_AuthProvider>(this, _$identity);
}

abstract class _AuthProvider extends AuthProvider {
  const factory _AuthProvider(
      {String? id,
      String? displayName,
      String? email,
      String? phoneNumber,
      String? photoURL,
      String? providerId}) = _$_AuthProvider;
  const _AuthProvider._() : super._();

  @override
  String? get id => throw _privateConstructorUsedError;
  @override
  String? get displayName => throw _privateConstructorUsedError;
  @override
  String? get email => throw _privateConstructorUsedError;
  @override
  String? get phoneNumber => throw _privateConstructorUsedError;
  @override
  String? get photoURL => throw _privateConstructorUsedError;
  @override
  String? get providerId => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthProviderCopyWith<_AuthProvider> get copyWith =>
      throw _privateConstructorUsedError;
}
