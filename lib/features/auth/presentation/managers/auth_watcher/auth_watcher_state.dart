part of 'auth_watcher_cubit.dart';

@freezed
@immutable
class AuthWatcherState with _$AuthWatcherState {
  const factory AuthWatcherState({
    @Default(false) bool isLoading,
    User? user,
    @Default(false) bool isAuthenticated,
    @Default(false) bool idTokenChanged,
    @Default(false) bool listenerAttached,
  }) = _AuthWatcherState;

  factory AuthWatcherState.init() => AuthWatcherState();
}
