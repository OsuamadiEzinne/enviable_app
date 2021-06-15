part of 'auth_cubit.dart';

@freezed
abstract class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool validate,
  }) = _Auth;

  factory AuthState.initial() => AuthState();
}
