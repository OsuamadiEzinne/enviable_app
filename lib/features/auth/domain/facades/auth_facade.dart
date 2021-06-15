import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

abstract class AuthFacade with FirebaseAuthMixin {
  Option<User> get currentUser;

  Stream<Option<User>> get onAuthStateChanged;

  Stream<Option<User>> get onUserChanges;

  Future<Either<AuthFailure, Unit>> login({
    required Phone phone,
  });

  Future<Either<AuthFailure, Unit>> googleAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> facebookAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> twitterAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(
    EmailAddress email,
  );

  Future<void> signOut();
}
