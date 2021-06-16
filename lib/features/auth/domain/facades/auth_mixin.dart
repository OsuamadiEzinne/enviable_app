import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/data/error_codes.dart';
import 'package:enviable_app/core/domain/entities/entities.dart';
import 'package:enviable_app/core/domain/response/index.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart' hide User;
import 'package:kt_dart/kt.dart' hide nullable;
import 'package:meta/meta.dart';

mixin FirebaseAuthMixin {
  Future<Either<AuthFailure, Unit>> signInWithCredentials({
    required AuthCredential? old,
    required AuthCredential? incoming,
  });

  @protected
  static Future<Either<AuthFailure, Unit>> handleAuthException(
    FirebaseAuthException e, {
    AuthProviderType? provider,
  }) async {
    switch (e.code) {
      case INVALID_EMAIL:
      case WRONG_PASSWORD:
        return left(AuthFailure.invalidCredentials());
      case INVALID_CREDENTIAL:
        return left(AuthFailure.invalidCredentials());
      case USER_NOT_FOUND:
        return left(AuthFailure.userAccountNotFound());
      case USER_DISABLED:
        return left(AuthFailure.userAccountDisabled());
      case CRED_ALREADY_IN_USE:
      case ACCOUNT_EXISTS_WITH_DIFFERENT_CRED:
        return AuthProviderType.fold(
          provider!.name,
          isGoogle: (name) async => left(AuthFailure.conflict(
            email: EmailAddress(e.email!),
            provider: AuthProviderType.Google,
            message: e.message ?? 'Unspecified failure',
            credentials: e.credential,
          )),
          isPassword: (name) async => left(AuthFailure.conflict(
            email: EmailAddress(e.email!),
            provider: AuthProviderType.Password,
            message: e.message ?? 'Unspecified failure',
            credentials: e.credential,
          )),
          isFacebook: (name) async => left(AuthFailure.conflict(
            email: EmailAddress(e.email!),
            provider: AuthProviderType.Facebook,
            message: e.message ?? 'Unspecified failure',
            credentials: e.credential,
          )),
          isTwitter: (name) async => left(AuthFailure.conflict(
            email: EmailAddress(e.email!),
            provider: AuthProviderType.Twitter,
            message: e.message ?? 'Unspecified failure',
            credentials: e.credential,
          )),
          isPhone: (name) async => right(unit),
        )!;
      case INVALID_ACTION_CODE:
        return left(AuthFailure.expiredOrInvalidToken(
          message: 'Invalid verification code, please try again.',
        ));
      case EMAIL_ALREADY_IN_USE:
        return left(AuthFailure.emailAlreadyInUse());
      case REQUIRES_RECENT_LOGIN:
        return left(AuthFailure.expiredOrInvalidToken(
          message: 'Re-authenticate to continue',
        ));
      case TOO_MANY_REQUESTS:
        return left(AuthFailure.tooManyRequests());
      case PROVIDER_ALREADY_LINKED:
        return right(unit);
      case OPERATION_NOT_ALLOWED:
        return left(AuthFailure.unknownFailure(
          message: 'Operation not allowed! Please contact support.',
        ));
      case WEAK_PASSWORD:
        return left(AuthFailure.weakPassword());
      case EXPIRED_ACTION_CODE:
        return left(AuthFailure.expiredOrInvalidToken(
            message: 'Expired verification code.'));
      case INVALID_VERIFICATION_ID:
      case INVALID_VERIFICATION_CODE:
        return left(AuthFailure.invalidCredentials(
          message: 'Invalid verification code.'
              "\nDidn't get the code? Tap Resend.",
        ));
      default:
        return left(AuthFailure.unknownFailure(
          message: (e is Exception || e is Error) ? e.message : null,
        ));
    }
  }
}

mixin FirestoreAuthMixin<T> {
  Future<T> get single;

  Future<bool> get docExists;

  Future<bool> isFieldNull(String field);

  Stream<Either<FailureResponse, KtList<T>>> get watch;

  Future<Either<FailureResponse, Unit>> create(T value);

  Stream<Either<FailureResponse, T>> get read;

  Future<Either<FailureResponse, Unit>> update(
    T value, {
    Duration timeout = const Duration(seconds: 8),
  });

  Future<Either<FailureResponse, Unit>> get delete;

  @protected
  Either<FailureResponse, R> handleFirestoreException<R>(e) {
    if (e is FirebaseException) {
      var error = e.code;
      var message = e.message;

      if (env.flavor == BuildFlavor.dev) log.e(message, error);

      switch (error) {
        case ABORTED:
          return left(FailureResponse.aborted(
            message ?? 'Operation was aborted',
          ));
        case ALREADY_EXISTS:
          return left(FailureResponse.alreadyExists(
            message ?? 'Account already exists!',
          ));
        case CANCELLED:
          return left(FailureResponse.cancelled(
            message ?? 'Operation was cancelled',
          ));
        case DATA_LOSS:
          return left(FailureResponse.dataLoss(
            message ?? 'Whoops Data Loss failure! Please try again.',
          ));
        case DEADLINE_EXCEEDED:
          return left(FailureResponse.deadlineExceeded(
            message ?? 'Deadline Exceeded',
          ));
        case INVALID_ARGUMENT:
          return left(FailureResponse.invalidArguments(
            message ?? 'Whoops! Invalid Argument.',
          ));
        case NOT_FOUND:
          return left(FailureResponse.notFound(
            message ?? 'Document not found!',
          ));
        case OK:
          return left(FailureResponse.ok(
            message ?? 'Operation was successful!',
          ));
        case OUT_OF_RANGE:
          return left(FailureResponse.outOfRange(
            message ?? 'Referenece out of scope!',
          ));
        case PERMISSION_DENIED:
          return left(FailureResponse.insufficientPermissions(
            message ??
                'You do not have sufficient permissions to view this resource.',
          ));
        case UNAUTHENTICATED:
          return left(FailureResponse.unAuthenticated(
            message ?? 'You are unauthorized to continue.',
          ));
        case UNAVAILABLE:
          return left(FailureResponse.unAvailable(
            message ?? 'Operation failed unexpectedly!',
          ));
        case UNIMPLEMENTED:
          return left(FailureResponse.unImplemented(
            message ?? 'Not implemented!',
          ));
        case RESOURCE_EXHAUSTED:
        case FAILED_PRECONDITION:
        case INTERNAL:
        case UNKNOWN:
        default:
          return left(FailureResponse.unknown(
            message: message ?? 'Unknown failure! Please contact support.',
          ));
      }
    }
    return left(FailureResponse.unknown(message: '${e.toString()}'));
  }
}
