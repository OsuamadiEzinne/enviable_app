part of 'auth_cubit.dart';

@freezed
class AuthState with _$AuthState {
  const AuthState._();

  const factory AuthState({
    @Default(false) bool isLoading,
    @Default(false) bool isResendingCode,
    @Default(false) bool validate,
    required DisplayName displayName,
    required EmailAddress emailAddress,
    required Phone phone,
    required OTPCode code,
    PhoneVerification? verification,
    @Default(Country.DEFAULT) Country country,
    @Default(None()) Option<Either<AuthFailure, Unit>> authStatus,
  }) = _Auth;

  factory AuthState.initial() => AuthState(
        displayName: DisplayName(''),
        emailAddress: EmailAddress(''),
        phone: Phone('', Country.DEFAULT),
        code: OTPCode(''),
      );
}
