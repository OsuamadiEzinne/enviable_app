import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;

abstract class AuthFacade with FirebaseAuthMixin {
  static const TIMEOUT_SEC = 15;

  Option<User> get currentUser;

  Stream<Option<User>> get onAuthStateChanged;

  Stream<Option<User>> get onUserChanges;

  Future<Either<AuthFailure, Unit>> login({
    required Phone phone,
    Duration timeout = const Duration(seconds: TIMEOUT_SEC),
    required void Function(PhoneAuthCredential credential)
        verificationCompleted,
    required void Function(AuthFailure failure) verificationFailed,
    required void Function(String verificationId, [int? forceResendToken])
        codeSent,
    int? forceResendingToken,
    required void Function(String verificationId) codeAutoRetrievalTimeout,
  });

  Future<Either<AuthFailure, Unit>> confirmOTPCode({
    required String code,
    required String verificationId,
  });

  Future<Either<AuthFailure, Unit>> googleAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> facebookAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> appleAuthentication([
    AuthCredential? pendingCredentials,
  ]);

  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(
    EmailAddress email,
  );

  Future<void> signOut();
}
