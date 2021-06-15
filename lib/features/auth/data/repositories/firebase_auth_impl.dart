import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/data/data.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:enviable_app/utils/utils.dart';

import 'firebase_user_extension.dart';

@LazySingleton(as: AuthFacade)
class FirebaseAuthImpl implements AuthFacade {
  static const int FACEBOOK_IMAGE_WIDTH = 600;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final InternetConnectionChecker _connectionChecker;
  AuthProviderType? provider;

  FirebaseAuthImpl(
    this._firebaseAuth,
    this._googleSignIn,
    this._connectionChecker,
  );

  Future<void> _checkForStableInternet() async {
    var hasStableInternet = await _connectionChecker.hasConnection;
    if (!hasStableInternet) throw AuthFailure.noInternetConnection();
  }

  Future<Tuple2<List<String>, bool>> _fetchSignInMethods(
    Either<String, EmailAddress> email, {
    required AuthProviderType auth,
  }) async {
    try {
      var _email = email.fold(id, (r) => r.getOrCrash);
      final result = await _firebaseAuth.fetchSignInMethodsForEmail(_email!);
      return Tuple2(result, result.contains(auth.name));
    } catch (e) {
      rethrow;
    }
  }

  Future<Either<AuthFailure, Unit>> _firebaseSignInWithCredentials(
      AuthCredential credential) async {
    try {
      // First we'll check for stable Internet connection
      await _checkForStableInternet();
      // SignIn to firebase using user's google account credentials
      await _firebaseAuth.signInWithCredential(credential);
      return right(unit);
    } on AuthFailure catch (e) {
      return left(e);
    } on FirebaseAuthException catch (e) {
      log.e('Exception here ====> $e');
      return FirebaseAuthMixin.handleAuthException(e);
    } catch (e) {
      return left(AuthFailure.unknownFailure(
        message: (e is Exception || e is Error) ? '$e' : null,
      ));
    }
  }

  @override
  Option<User> get currentUser => optionOf(_firebaseAuth.currentUser?.domain);

  @override
  Stream<Option<User>> get onAuthStateChanged =>
      _firebaseAuth.authStateChanges().map((user) => optionOf(user?.domain));

  @override
  Stream<Option<User>> get onUserChanges =>
      _firebaseAuth.userChanges().map((user) => optionOf(user?.domain));

  @override
  Future<Either<AuthFailure, Unit>> login({
    required Phone phone,
  }) async {
    try {
      // First we'll check for stable Internet connection
      await _checkForStableInternet();

      await _firebaseAuth.verifyPhoneNumber(
        phoneNumber: '${phone.getOrEmpty}',
        timeout: Duration(seconds: 120),
        verificationCompleted: (AuthCredential credential) async {
          // called only when the verification is successfully
          // completed automatically using Auto Retrieval
          // Call _auth.signInWithCredential()
        },
        verificationFailed: (FirebaseAuthException ex) {
          // Called when verification failed and the user is not logged in
          print('Exception CODE ===> ${ex.code}');
          print('Exception received ===> ${ex.message}');
        },
        codeSent: (String verificationId, [int? forceResendToken]) {
          // show dialog to manually receive input from user
        },
        codeAutoRetrievalTimeout: (String verificationId) {
          print(verificationId);
          print('Timout');
        },
      );

      return right(unit);
    } on AuthFailure catch (e) {
      return left(e);
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthMixin.handleAuthException(e);
    } catch (e) {
      return left(AuthFailure.unknownFailure(
        message: (e is Exception || e is Error) ? '$e' : null,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> googleAuthentication([
    AuthCredential? pendingCredentials,
  ]) async {
    try {
      // First we'll check for stable Internet connection
      await _checkForStableInternet();
      // Attempt authenticating user with google credentials
      var account = await _googleSignIn.signIn();
      // If null, => user cancelled authentication
      if (account == null) throw AuthFailure.cancelledAction();

      // get authentication details [idToken], [accessToken]
      final authentication = await account.authentication;

      // Get instance of AuthCredentials
      AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: authentication.idToken,
        accessToken: authentication.accessToken,
      );

      // Fetch User's sign-in methods
      var _provider = await _fetchSignInMethods(
        left(account.email),
        auth: AuthProviderType.Google,
      );

      // Checks if Sign in method exists for email address && Current Provider does not exist on Firebase
      if (_provider.value1.isNotEmpty && !_provider.value2)
        await AuthProviderType.fold<Future<AuthFailure>>(
          _provider.value1.first,
          isPassword: (name) {
            provider = AuthProviderType.Password;
            throw FirebaseAuthException(
              code: ACCOUNT_EXISTS_WITH_DIFFERENT_CRED,
              message:
                  'An account already exists with the same email address but different sign-in credentials.'
                  '\n\nClick to enter your Password.',
              email: account.email,
              credential: authCredential,
            );
          },
          isFacebook: (name) {
            provider = AuthProviderType.Facebook;
            throw FirebaseAuthException(
              code: ACCOUNT_EXISTS_WITH_DIFFERENT_CRED,
              message:
                  'An account already exists with the same email address but different sign-in credentials.'
                  '\n\nSign in with $name to continue.',
              email: account.email,
              credential: authCredential,
            );
          },
          // orElse: (name) => null,
        );

      // PERFORM FIREBASE SIGN-IN
      final _result = await _firebaseSignInWithCredentials(authCredential);

      return _result;
    } on AuthFailure catch (e) {
      return left(e);
    } on FirebaseAuthException catch (e) {
      return FirebaseAuthMixin.handleAuthException(e);
    } catch (e) {
      return left(AuthFailure.unknownFailure(
        message: (e is Exception || e is Error) ? '$e' : null,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> signInWithCredentials({
    required AuthCredential? old,
    required AuthCredential? incoming,
  }) async {
    try {
      // First we'll check for stable Internet connection
      await _checkForStableInternet();
      if (old != null && incoming == null) {
        return await _firebaseSignInWithCredentials(old);
      }

      final result = await _firebaseSignInWithCredentials(old!);

      return result.fold((_) => Future.value(left(_)), (_) async {
        // Link with firebase provider
        await _firebaseAuth.currentUser?.linkWithCredential(incoming!);

        return Future.value(right(_));
      });
    } on AuthFailure catch (e) {
      return left(e);
    } on FirebaseAuthException catch (e) {
      if (e.code == WRONG_PASSWORD)
        return left(AuthFailure.invalidCredentials(
            message: 'Wrong or invalid password.'));
      return FirebaseAuthMixin.handleAuthException(e);
    } catch (e) {
      return left(AuthFailure.unknownFailure(
        message: (e is Exception || e is Error) ? '$e' : null,
      ));
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> twitterAuthentication([
    AuthCredential? pendingCredentials,
  ]) async =>
      throw UnimplementedError(
        'Twitter '
        'Authentication Feature not Implemented.\nPlease contact support.',
      );

  @override
  Future<void> signOut() => Future.wait([
        _firebaseAuth.signOut(),
        _googleSignIn.signOut(),
      ]);

  @override
  Future<Either<AuthFailure, Unit>> facebookAuthentication([
    AuthCredential? pendingCredentials,
  ]) async =>
      throw UnimplementedError(
        'Authentication Feature not Implemented.\nPlease contact support.',
      );

  @override
  Future<Either<AuthFailure, Unit>> sendPasswordResetEmail(
    EmailAddress email,
  ) async =>
      throw UnimplementedError(
        'Authentication Feature not Implemented.\nPlease contact support.',
      );
}