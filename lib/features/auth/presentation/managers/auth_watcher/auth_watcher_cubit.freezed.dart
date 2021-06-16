// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'auth_watcher_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthWatcherStateTearOff {
  const _$AuthWatcherStateTearOff();

  _AuthWatcherState call(
      {bool isLoading = false,
      User? user,
      bool isAuthenticated = false,
      bool idTokenChanged = false,
      bool listenerAttached = false}) {
    return _AuthWatcherState(
      isLoading: isLoading,
      user: user,
      isAuthenticated: isAuthenticated,
      idTokenChanged: idTokenChanged,
      listenerAttached: listenerAttached,
    );
  }
}

/// @nodoc
const $AuthWatcherState = _$AuthWatcherStateTearOff();

/// @nodoc
mixin _$AuthWatcherState {
  bool get isLoading => throw _privateConstructorUsedError;
  User? get user => throw _privateConstructorUsedError;
  bool get isAuthenticated => throw _privateConstructorUsedError;
  bool get idTokenChanged => throw _privateConstructorUsedError;
  bool get listenerAttached => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthWatcherStateCopyWith<AuthWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthWatcherStateCopyWith<$Res> {
  factory $AuthWatcherStateCopyWith(
          AuthWatcherState value, $Res Function(AuthWatcherState) then) =
      _$AuthWatcherStateCopyWithImpl<$Res>;
  $Res call(
      {bool isLoading,
      User? user,
      bool isAuthenticated,
      bool idTokenChanged,
      bool listenerAttached});

  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class _$AuthWatcherStateCopyWithImpl<$Res>
    implements $AuthWatcherStateCopyWith<$Res> {
  _$AuthWatcherStateCopyWithImpl(this._value, this._then);

  final AuthWatcherState _value;
  // ignore: unused_field
  final $Res Function(AuthWatcherState) _then;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? isAuthenticated = freezed,
    Object? idTokenChanged = freezed,
    Object? listenerAttached = freezed,
  }) {
    return _then(_value.copyWith(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      idTokenChanged: idTokenChanged == freezed
          ? _value.idTokenChanged
          : idTokenChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      listenerAttached: listenerAttached == freezed
          ? _value.listenerAttached
          : listenerAttached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }

  @override
  $UserCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value));
    });
  }
}

/// @nodoc
abstract class _$AuthWatcherStateCopyWith<$Res>
    implements $AuthWatcherStateCopyWith<$Res> {
  factory _$AuthWatcherStateCopyWith(
          _AuthWatcherState value, $Res Function(_AuthWatcherState) then) =
      __$AuthWatcherStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {bool isLoading,
      User? user,
      bool isAuthenticated,
      bool idTokenChanged,
      bool listenerAttached});

  @override
  $UserCopyWith<$Res>? get user;
}

/// @nodoc
class __$AuthWatcherStateCopyWithImpl<$Res>
    extends _$AuthWatcherStateCopyWithImpl<$Res>
    implements _$AuthWatcherStateCopyWith<$Res> {
  __$AuthWatcherStateCopyWithImpl(
      _AuthWatcherState _value, $Res Function(_AuthWatcherState) _then)
      : super(_value, (v) => _then(v as _AuthWatcherState));

  @override
  _AuthWatcherState get _value => super._value as _AuthWatcherState;

  @override
  $Res call({
    Object? isLoading = freezed,
    Object? user = freezed,
    Object? isAuthenticated = freezed,
    Object? idTokenChanged = freezed,
    Object? listenerAttached = freezed,
  }) {
    return _then(_AuthWatcherState(
      isLoading: isLoading == freezed
          ? _value.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      user: user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      isAuthenticated: isAuthenticated == freezed
          ? _value.isAuthenticated
          : isAuthenticated // ignore: cast_nullable_to_non_nullable
              as bool,
      idTokenChanged: idTokenChanged == freezed
          ? _value.idTokenChanged
          : idTokenChanged // ignore: cast_nullable_to_non_nullable
              as bool,
      listenerAttached: listenerAttached == freezed
          ? _value.listenerAttached
          : listenerAttached // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_AuthWatcherState implements _AuthWatcherState {
  const _$_AuthWatcherState(
      {this.isLoading = false,
      this.user,
      this.isAuthenticated = false,
      this.idTokenChanged = false,
      this.listenerAttached = false});

  @JsonKey(defaultValue: false)
  @override
  final bool isLoading;
  @override
  final User? user;
  @JsonKey(defaultValue: false)
  @override
  final bool isAuthenticated;
  @JsonKey(defaultValue: false)
  @override
  final bool idTokenChanged;
  @JsonKey(defaultValue: false)
  @override
  final bool listenerAttached;

  @override
  String toString() {
    return 'AuthWatcherState(isLoading: $isLoading, user: $user, isAuthenticated: $isAuthenticated, idTokenChanged: $idTokenChanged, listenerAttached: $listenerAttached)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _AuthWatcherState &&
            (identical(other.isLoading, isLoading) ||
                const DeepCollectionEquality()
                    .equals(other.isLoading, isLoading)) &&
            (identical(other.user, user) ||
                const DeepCollectionEquality().equals(other.user, user)) &&
            (identical(other.isAuthenticated, isAuthenticated) ||
                const DeepCollectionEquality()
                    .equals(other.isAuthenticated, isAuthenticated)) &&
            (identical(other.idTokenChanged, idTokenChanged) ||
                const DeepCollectionEquality()
                    .equals(other.idTokenChanged, idTokenChanged)) &&
            (identical(other.listenerAttached, listenerAttached) ||
                const DeepCollectionEquality()
                    .equals(other.listenerAttached, listenerAttached)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(isLoading) ^
      const DeepCollectionEquality().hash(user) ^
      const DeepCollectionEquality().hash(isAuthenticated) ^
      const DeepCollectionEquality().hash(idTokenChanged) ^
      const DeepCollectionEquality().hash(listenerAttached);

  @JsonKey(ignore: true)
  @override
  _$AuthWatcherStateCopyWith<_AuthWatcherState> get copyWith =>
      __$AuthWatcherStateCopyWithImpl<_AuthWatcherState>(this, _$identity);
}

abstract class _AuthWatcherState implements AuthWatcherState {
  const factory _AuthWatcherState(
      {bool isLoading,
      User? user,
      bool isAuthenticated,
      bool idTokenChanged,
      bool listenerAttached}) = _$_AuthWatcherState;

  @override
  bool get isLoading => throw _privateConstructorUsedError;
  @override
  User? get user => throw _privateConstructorUsedError;
  @override
  bool get isAuthenticated => throw _privateConstructorUsedError;
  @override
  bool get idTokenChanged => throw _privateConstructorUsedError;
  @override
  bool get listenerAttached => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$AuthWatcherStateCopyWith<_AuthWatcherState> get copyWith =>
      throw _privateConstructorUsedError;
}
