import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_watcher_state.dart';
part 'auth_watcher_cubit.freezed.dart';

typedef Tasks = void Function(Option<User> option);

@injectable
class AuthWatcherCubit extends Cubit<AuthWatcherState> {
  final AuthFacade _facade;
  StreamSubscription<Option<User>>? _authStateChanges;
  StreamSubscription<Option<User>>? _userChanges;

  AuthWatcherCubit(this._facade) : super(AuthWatcherState.init());

  void toggleLoding([bool? loading]) => emit(state.copyWith(
        isLoading: loading ?? !state.isLoading,
      ));

  // This will always return the current user data
  User? get firebaseUser => _facade.currentUser.fold(() => null, id);

  void listenToAuthChanges(Tasks actions) async {
    toggleLoding();

    emit(state.copyWith(
      isAuthenticated: _facade.currentUser.isSome(),
      user: firebaseUser,
    ));
    // Cancel previous subscription
    await unsubscribeAuthChanges;
    // Install new subscription
    _authStateChanges ??= _facade.onAuthStateChanged.listen(actions);

    emit(state.copyWith(listenerAttached: true));

    toggleLoding();
  }

  void onUserChanges(Tasks actions) async {
    toggleLoding();

    emit(state.copyWith(
      isAuthenticated: _facade.currentUser.isSome(),
      user: firebaseUser,
    ));
    // Cancel previous subscription
    await unsubscribeUserChanges;
    // Install new subscription
    _userChanges ??= _facade.onUserChanges.listen(actions);

    emit(state.copyWith(listenerAttached: true));

    toggleLoding();
  }

  Future<void> get unsubscribeAuthChanges async =>
      await _authStateChanges?.cancel();

  Future<void> get unsubscribeUserChanges async => await _userChanges?.cancel();

  Future<void> get signOut async {
    toggleLoding();

    try {
      // Signout the Authenticated User
      await _facade.signOut();
    } catch (_) {
      log.e('Exception caught in AUTH WATCHER CUBIT [signOut] ==> $_');
    }

    emit(state.copyWith(
      isAuthenticated: _facade.currentUser.isSome(),
      user: firebaseUser,
    ));

    toggleLoding();
  }

  @override
  Future<void> close() async {
    await _authStateChanges?.cancel();
    await _userChanges?.cancel();
    return super.close();
  }
}
