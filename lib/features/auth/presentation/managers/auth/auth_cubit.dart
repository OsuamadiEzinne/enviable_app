import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:enviable_app/core/domain/entities/fields/fields.dart';
import 'package:enviable_app/features/auth/domain/index.dart';
import 'package:enviable_app/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_state.dart';
part 'auth_cubit.freezed.dart';

@injectable
class AuthCubit extends Cubit<AuthState> {
  final AuthFacade _facade;
  // StreamController phoneAuthController;

  AuthCubit(
    this._facade,
  ) : super(AuthState.initial());

  void countryChanged(Country? value) => emit(state.copyWith(
        country: value!,
        authStatus: none(),
      ));

  void phoneChanged(String input) => emit(state.copyWith(
        phone: Phone(input, state.country),
        authStatus: none(),
      ));

  void toggleLoding([bool? loading]) => emit(state.copyWith(
        isLoading: loading ?? !state.isLoading,
      ));

  void initOTPVerification(PhoneVerification verification) =>
      emit(state.copyWith(
        verification: verification,
        phone: verification.phone,
        authStatus: none(),
      ));

  void codeChanged(String code) => emit(state.copyWith(
        code: OTPCode(code),
        authStatus: none(),
      ));

  void googleAuthentication([AuthCredential? incoming]) async {
    toggleLoding();

    emit(state.copyWith(authStatus: none()));

    var failureOrUnit = await _facade.googleAuthentication(incoming);

    emit(state.copyWith(authStatus: optionOf(failureOrUnit)));

    toggleLoding();
  }

  void loginWithPhone([int? resendToken]) async {
    toggleLoding();

    emit(state.copyWith(
      isResendingCode: resendToken != null,
    ));

    final phone = state.phone;
    // ignore: omit_local_variable_types
    Either<AuthFailure, Unit>? failureOrUnit;

    if (state.phone.isValid) {
      failureOrUnit = await _facade.login(
        phone: phone,
        forceResendingToken: resendToken,
        verificationCompleted: (credential) async {
          toggleLoding(false);

          emit(state.copyWith(
            isResendingCode: false,
            code: OTPCode(credential.smsCode!),
            verification: state.verification?.copyWith(
                  phone: phone,
                  verified: true,
                  credential: credential,
                ) ??
                PhoneVerification(
                  phone: phone,
                  verified: true,
                  credential: credential,
                  verificationId: credential.verificationId ?? '',
                ),
          ));
        },
        verificationFailed: (ex) {
          toggleLoding(false);

          emit(state.copyWith(
            authStatus: some(left(ex)),
            isResendingCode: false,
          ));
        },
        codeSent: (verificationId, [forceResendToken]) {
          emit(state.copyWith(
            isResendingCode: false,
            verification: PhoneVerification(
              phone: phone,
              verificationId: verificationId,
              resendToken: forceResendToken,
              codeSent: true,
            ),
          ));
        },
        codeAutoRetrievalTimeout: (verificationId) {
          toggleLoding(false);

          emit(state.copyWith(
            isResendingCode: false,
            verification: state.verification?.copyWith(
              phone: phone,
              verified: false,
              verificationId: verificationId,
              autoRetrievalTimedout: true,
            ),
          ));
        },
      );
    }

    emit(state.copyWith(
      // When token is null, code hasn't been sent
      validate: resendToken == null,
      authStatus: optionOf(failureOrUnit),
      // Let state 'isLoading' depend on validity of phone number field
      isLoading: state.phone.isValid,
    ));
  }

  void verifySMSCode() async {
    toggleLoding();

    Either<AuthFailure, Unit>? failureOrUnit;

    if (state.code.isValid && state.verification != null)
      failureOrUnit = await _facade.confirmOTPCode(
        code: state.code.getOrEmpty!,
        verificationId: state.verification!.verificationId,
      );

    emit(state.copyWith(
      validate: true,
      authStatus: optionOf(failureOrUnit),
    ));

    toggleLoding();
  }

  void signInWithCredentials({
    AuthCredential? credential,
    AuthProviderType? provider,
    AuthCredential? newCredentials,
  }) async {
    toggleLoding();

    Either<AuthFailure, Unit>? failureOrUnit;

    if (provider == null) {
      // Perform a normal Sign In with credentials
      failureOrUnit = await _facade.signInWithCredentials(
        old: credential,
        incoming: newCredentials,
      );

      log.e(failureOrUnit.fold((l) => l.message, (r) => 'Successful'));
    }

    // if (provider != null)
    //   failureOrUnit =
    //       await AuthProviderType.fold<FutureOr<Either<AuthFailure, Unit>>>(
    //     provider.name,
    //     isPassword: (name) async {
    //       try {
    //         final cred = EmailAuthProvider.credential(
    //           email: '${state.emailAddress.getOrEmpty}',
    //           password: '${state.password.getOrEmpty}',
    //         );
    //         return await _auth.signInWithCredentials(cred, e.incoming);
    //       } on AuthFailure catch (e) {
    //         return left(e);
    //       }
    //     },
    //   );

    emit(state.copyWith(
      validate: true,
      authStatus: optionOf(failureOrUnit),
    ));

    toggleLoding();
  }
}
